import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract final class AppBootstrap {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initEnv();
    await _initSupabase();
    _initGlobalSettings();
  }

  static Future<void> _initEnv() async {
    try {
      await dotenv.load(fileName: '.env');
    } catch (e) {
      debugPrint('.env file not found: $e');
    }
  }

  static Future<void> _initSupabase() async {
    try {
      final supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
      final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
      await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
    } catch (e) {
      debugPrint('Supabase failed: $e');
    }
  }

  static void _initGlobalSettings() {
    GoogleFonts.config.allowRuntimeFetching = false;
    debugRepaintRainbowEnabled = false;
  }
}