import 'dart:developer' as developer;
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

void logger(Object message) => developer.log(message.toString());

int getTimestamp() {
  return DateTime.now().millisecondsSinceEpoch;
}

bool isIOS() {
  return Platform.isIOS;
}

Future<void> launchURL(String url) async {
  try {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  } catch (e) {
    logger('Error launching url: $e');
  }
}

bool isYoutubeUrl(String value) {
  final uri = Uri.tryParse(value.trim());
  if (uri == null) return false;

  // youtu.be/VIDEO_ID
  if (uri.host == 'youtu.be') {
    return uri.pathSegments.isNotEmpty;
  }

  // youtube.com/watch?v=VIDEO_ID
  if (uri.host.contains('youtube.com')) {
    return uri.queryParameters.containsKey('v') ||
        uri.pathSegments.contains('shorts');
  }

  return false;
}
