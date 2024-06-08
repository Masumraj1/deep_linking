

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

// import 'package:uni_links/uni_links.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // StreamSubscription? _sub;
  @override
  // void initState() {
  //   super.initState();
  //   initUniLinks();
  // }
  //
  // Future<void> initUniLinks() async {
  //   final initialUri = await getInitialUri();
  //   if (initialUri != null) {
  //   }
  //   _sub = linkStream.listen((String? link) {
  //     if (link != null) {
  //       onReceivingLink(link);
  //     }
  //   }, onError: (err) {
  //   });
  // }
  //
  // onReceivingLink(String? link) {
  //   log(link.toString(), name: "link received");
  //   if (link != null) {
  //     //TODO:
  //   }
  // }
  //
  // @override
  // void dispose() {
  //   _sub?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///=================================HomeScreen===========================
      appBar: AppBar(
        title: const Text('HomeScreen'),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          ///==============================view blogs button==========================
          child: ElevatedButton(
            onPressed: () {
              // handleMessageClick(context, '/blogs');
              Navigator.pushNamed(context, '/blogs');
            },
            child: const Text('View Blogs'),
          ),
        ),
      ),
    );
  }
}


// void handleMessageClick(BuildContext context, String link) {
//   Uri uri = Uri.parse("https://dev.to/api/articles?username=djsmk123");
//
//   if (uri.scheme == 'app' && uri.host == 'blog') {
//     String blogId = uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : '';
//     Navigator.pushNamed(context, '/blog/$blogId');
//   } else {
//     // Handle other types of links or show an error
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('Invalid link'),
//     ));
//   }
// }



  //  void uniHandler(Uri? uri) {
  //   if (uri == null || uri.queryParameters.isEmpty) return;
  //
  //   Map<String, String> param = uri.queryParameters;
  //
  //   String receivedCode = param['code'] ?? "";
  //
  //   if (receivedCode == "blogs") {
  //     Navigator.push(
  //       ContextUtility.context!,
  //       MaterialPageRoute(builder: (_) => const BlogListScreen()),
  //     );
  //   } else {
  //     Navigator.push(
  //       ContextUtility.context!,
  //       MaterialPageRoute(builder: (_) => const RedScreen()),
  //     );
  //   }
  // }
