import 'package:amazon_clone/seller_view/addProduct.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: ElevatedButton(child: Text("Add a new product"), onPressed: (){
Navigator.pushNamed(context, AddProductScreen.routeName);

      },),),
    );
  }
}