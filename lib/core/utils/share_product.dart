import 'package:share_plus/share_plus.dart';

void shareProduct(String title, String url) {
  final String message =
      'Посмотри, что я нашел в Google Play: \n\n$title\n\n$url';
  SharePlus.instance.share(ShareParams(text: message));
}
