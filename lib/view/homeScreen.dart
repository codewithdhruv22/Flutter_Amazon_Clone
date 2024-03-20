import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider_controller/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home-screen';
  @override
  Widget build(BuildContext context) {
    final user  = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.password),
             Text(user.name),
              Text(user.email),
               Text(user.type),
                Text(user.address),
                Text(user.stamp)
   
          ],
        )),
      )
   ;
  }
}