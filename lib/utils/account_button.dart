import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  String text;
  VoidCallback onTap;
   ProfileButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 13),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white , width: 0.0),
          borderRadius: BorderRadius.circular(30),
          color: Colors.white
        ),
        height: 40,
        child: OutlinedButton(
          
          style: ElevatedButton.styleFrom(
            
            backgroundColor: Colors.black12.withOpacity(0.05) ,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            )
          ),
          onPressed: (){
      onTap();
        }, child: Text(text, style: TextStyle(fontSize: 16, color: Colors.black),)),
      ),
    );
  }
}