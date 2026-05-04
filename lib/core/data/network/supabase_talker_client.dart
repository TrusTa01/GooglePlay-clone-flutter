import 'package:http/http.dart' as http;
import 'package:talker_flutter/talker_flutter.dart';

class SupabaseTalkerClient extends http.BaseClient {
  final http.Client _inner = http.Client();
  final Talker talker;
  static const Set<String> _sensitiveQueryKeys = {
    'access_token',
    'token',
    'api_key',
    'apikey',
    'key',
    'password',
    'pwd',
    'secret',
    'signature',
    'sig',
  };

  SupabaseTalkerClient({required this.talker});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final sanitizedUrl = _sanitizeUrl(request.url);
    talker.info('HTTP Request: ${request.method} $sanitizedUrl');
    try {
      final response = await _inner.send(request);
      talker.info(
        'HTTP Response: ${response.statusCode} ${request.method} $sanitizedUrl',
      );
      return response;
    } catch (e, stackTrace) {
      talker.error(
        'HTTP Request failed: ${request.method} $sanitizedUrl\n$e\n$stackTrace',
      );
      rethrow;
    }
  }

  Uri _sanitizeUrl(Uri url) {
    if (url.query.isEmpty) return url;
    final sanitizedQuery = <String, String>{};
    for (final entry in url.queryParametersAll.entries) {
      final key = entry.key;
      final values = entry.value;
      final isSensitive = _sensitiveQueryKeys.contains(key.toLowerCase());
      sanitizedQuery[key] = isSensitive
          ? '***'
          : (values.isEmpty ? '' : values.join(','));
    }
    return url.replace(queryParameters: sanitizedQuery);
  }
}
