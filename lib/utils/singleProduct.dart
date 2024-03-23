import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  String imageUrl;
   SingleProduct({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: DecoratedBox(
        decoration:BoxDecoration(border: Border.all(color: Colors.black, width: 0.5), borderRadius: BorderRadius.circular(10), color: Colors.white) ,
        child: Container(
          width: 180,
          height: 200,
          padding: EdgeInsets.all(10),
          child: Image.network(imageUrl, fit: BoxFit.fitHeight, width: 180,),
        ),
      ),
    );
  }
}