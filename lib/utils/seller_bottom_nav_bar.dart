import 'package:amazon_clone/seller_view/earnings.dart';
import 'package:amazon_clone/seller_view/my_delivery.dart';
import 'package:amazon_clone/seller_view/my_orders.dart';
import 'package:amazon_clone/view/auth/authScreen.dart';
import 'package:amazon_clone/view/homeScreen.dart';
import 'package:amazon_clone/view/profileScreen.dart';
import 'package:flutter/material.dart';

class SellerBottomNavBar extends StatefulWidget {
  static const String routeName ='/navbar';
  const SellerBottomNavBar({super.key});

  @override
  State<SellerBottomNavBar> createState() => _SellerBottomNavBarState();
}

class _SellerBottomNavBarState extends State<SellerBottomNavBar> {

int screen_index = 0;
List<Widget> screens = [
MyOrders(),
MyEarnings(),
MyDelivery(),
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
BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_rounded,color: screen_index == 0 ? Colors.amber : Colors.black,),


 label: ""),
BottomNavigationBarItem(icon: Icon(Icons.monetization_on, color : screen_index == 1 ? Colors.amber : Colors.black,), label: ""),
BottomNavigationBarItem(icon: Icon(Icons.delivery_dining, color : screen_index == 2 ? Colors.amber : Colors.black,), label: "")

        ],
      ),
    );
  }
}