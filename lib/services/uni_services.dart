



import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import '../blogs_list_screen.dart';
import 'context_utility.dart';

class UniServices {   
  static String _code = "";
  static String get code => _code;
  static bool get hasCode => _code.isNotEmpty;

  static void reset() => _code = '';

  static Future<void> init() async {
    final appLinks = AppLinks();

    // Handle the app being opened from a terminated state
    try {
      final uri = await appLinks.getInitialAppLink();
      uniHandler(uri);
    } catch (e) {
      print("Error receiving initial app link: $e");
    }

    // Handle the app being opened in the foreground from a deep link
    appLinks.uriLinkStream.listen((uri) {
      uniHandler(uri);
    }, onError: (err) {
      print("Error receiving app link stream: $err");
    });
  }

  static void uniHandler(Uri? uri) {
    if (uri == null || uri.queryParameters.isEmpty) return;

    Map<String, String> param = uri.queryParameters;

    String receivedCode = param['code'] ?? "";

    if (receivedCode == "blogs") {
      Navigator.push(
        ContextUtility.context!,
        MaterialPageRoute(builder: (_) => const BlogListScreen()),
      );
    } else {
      Navigator.push(
        ContextUtility.context!,
        MaterialPageRoute(builder: (_) => const Green()),
      );
    }
  }
}


class Green extends StatelessWidget {
  const Green({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green,);
  }
}
