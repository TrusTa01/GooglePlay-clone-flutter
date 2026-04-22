import 'package:http/http.dart' as http;
import 'package:talker_flutter/talker_flutter.dart';

class SupabaseTalkerClient extends http.BaseClient {
  final http.Client _inner = http.Client();
  final Talker talker;

  SupabaseTalkerClient({required this.talker});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    talker.info('HTTP Request: ${request.method} ${request.url}');

    final response = await _inner.send(request);

    talker.info('Response: ${response.statusCode}');

    return response;
  }
}
