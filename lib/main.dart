

import 'package:flutter/material.dart';
import 'package:newdeep/services/context_utility.dart';
import 'package:newdeep/services/uni_services.dart';
import 'blog_details_screen.dart';
import 'blogs_list_screen.dart';
import 'home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await UniServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ContextUtility.navigatorKey,

      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>  const HomeScreen(),
        '/blogs': (context) => const BlogListScreen(),
        '/green': (context) => const Green(),
      },

      ///==========================This property is a callback function that dynamically generates routes based on the route settings.====================
      onGenerateRoute: (settings) {
        if (settings.name!.startsWith('/blog/')) {
          var id = settings.name!.substring(6);
          return MaterialPageRoute(
            builder: (context) => BlogDetailsScreen(id: id),
          );
        }
        return null;
      },
    );
  }
}



