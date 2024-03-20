import 'package:amazon_clone/view/auth/authScreen.dart';
import 'package:amazon_clone/view/homeScreen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName ='/navbar';
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

int screen_index = 0;
List<Widget> screens = [
HomeScreen(),
AuthScreen(),
];


updateScreen(int index){
  setState(() {
    screen_index  = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body:  screens[screen_index],
      bottomNavigationBar: BottomNavigationBar(
onTap: updateScreen,
selectedItemColor: Colors.amber,
unselectedItemColor: Colors.black,

iconSize: 30,
        items: [
BottomNavigationBarItem(icon: Icon(Icons.home,color: screen_index == 0 ? Colors.amber : Colors.black,),


 label: ""),
BottomNavigationBarItem(icon: Icon(Icons.person, color : screen_index == 1 ? Colors.amber : Colors.black,), label: "")

        ],
      ),
    );
  }
}