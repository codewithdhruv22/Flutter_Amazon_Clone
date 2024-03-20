import 'package:amazon_clone/utils/bottom_nav_bar.dart';
import 'package:amazon_clone/view/auth/authScreen.dart';
import 'package:amazon_clone/view/homeScreen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (_) => AuthScreen());
    case BottomNavBar.routeName:
      return MaterialPageRoute(builder: (_) => BottomNavBar());

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(child: Text("PAGE NOT EXIST.")),
              ));
  }
}
