import 'package:blog_post/routes/routing_constants.dart';
import 'package:blog_post/utils/styling.dart';
import 'package:blog_post/views/pages/authentication_screen.dart';
import 'package:blog_post/views/pages/home_page.dart';
import 'package:blog_post/views/pages/post_details_page.dart';
import 'package:blog_post/views/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:blog_post/routes/router.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightThemeData,
      onGenerateRoute: router.generateRoute,
      initialRoute: SplashPageRoute,
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: AppTheme.lightThemeData,
    //   initialRoute: "/",
    //   routes: {
    //     "/": (context) => const SplashPage(),
    //     "/login": (context) => const AuthenticationScreen(),
    //     "/home": (context) => const HomePage(),
    //     "/post_details": (context) => const PostDetailsPage(),
    //   },
    // );
  }
}
