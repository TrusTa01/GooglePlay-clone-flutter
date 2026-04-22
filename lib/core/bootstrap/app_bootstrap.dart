import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_play/core/bootstrap/app_botstrap_exception.dart';
import 'package:google_play/core/data/network/supabase_talker_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract final class AppBootstrap {
  static Future<void> init(Talker talker) async {
    await _initEnv();
    await _initSupabase(talker);
    _initGlobalSettings();
  }

  static Future<void> _initEnv() => dotenv.load(fileName: '.env');

  static Future<void> _initSupabase(Talker talker) async {
    final supabaseUrl = (dotenv.env['SUPABASE_URL'] ?? '').trim();
    final supabaseAnonKey = (dotenv.env['SUPABASE_ANON_KEY'] ?? '').trim();
    if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
      throw AppBootstrapException(
        'В .env не заданы SUPABASE_URL или SUPABASE_ANON_KEY - '
        'оба ключа обязательны для запуска',
      );
    }
    try {
      await Supabase.initialize(
        url: supabaseUrl,
        anonKey: supabaseAnonKey,
        httpClient: SupabaseTalkerClient(talker: talker),
      );
    } catch (e, st) {
      try {
        if (Supabase.instance.isInitialized) {
          await Supabase.instance.dispose();
        }
      } catch (_) {}
      Error.throwWithStackTrace(e, st);
    }
  }

  static void _initGlobalSettings() {
    GoogleFonts.config.allowRuntimeFetching = false;
    debugRepaintRainbowEnabled = false;
  }
}
