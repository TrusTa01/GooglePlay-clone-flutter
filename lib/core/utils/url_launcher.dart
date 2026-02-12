import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> launchMyUrl(String urlString) async {
  if (urlString.isEmpty) return false;
  try {
    final Uri url = Uri.parse(urlString);
    return await launchUrl(url, mode: LaunchMode.externalApplication);
  } on FormatException catch (e) {
    debugPrint('launchMyUrl: неверный URL "$urlString": $e');
    return false;
  } catch (e, stack) {
    debugPrint('launchMyUrl: $e');
    debugPrint(stack.toString());
    return false;
  }
}

String encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map(
        (MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
      )
      .join('&');
}

Future<void> mailTo({
  required String email,
  String subject = 'Вопрос по приложению',
  String body = 'Здравствуйте!',
}) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    query: encodeQueryParameters(<String, String>{
      'subject': subject,
      'body': body,
    }),
  );
  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    throw 'Не удалось открыть электронную почту';
  }
}
