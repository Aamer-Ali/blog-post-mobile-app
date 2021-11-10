import 'package:blog_post/routes/routing_constants.dart';
import 'package:blog_post/views/pages/authentication_screen.dart';
import 'package:blog_post/views/pages/home_page.dart';
import 'package:blog_post/views/pages/post_details_page.dart';
import 'package:blog_post/views/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:blog_post/routes/routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashPageRoute:
      return MaterialPageRoute(builder: (context) => const SplashPage());
    case AuthenticationPageRoute:
      return MaterialPageRoute(
          builder: (context) => const AuthenticationScreen());
    case HomePageRoute:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case PostDetailsPageRoute:
      var args = settings.arguments;
      return MaterialPageRoute(builder: (context) => PostDetailsPage(postId: args));
  }
  throw "";
}
