import 'package:amazon_clone/controller/provider_controller/user_provider.dart';
import 'package:amazon_clone/utils/account_button.dart';
import 'package:amazon_clone/utils/singleProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),

        child: AppBar(


          flexibleSpace: Container(
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          title:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset("assets/images/amazon_logo.png",
                  width: 90 , height: 50,),
                ),
                Spacer(),
             IconButton(onPressed: (){}, icon: Icon(Icons.notifications, size: 30,)),
                // SizedBox(width: 10,),
                IconButton(onPressed: (){}, icon: Icon(Icons.search, size: 30,)),
              ],
            ),
        ),
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text("Hey👋! ${user.name}", style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500
            
          ),),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileButton(text: "Your Orders", onTap: (){},),
            ProfileButton(text: "Your Wishlist", onTap: (){},),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileButton(text: "Seller Mode", onTap: (){},),
            ProfileButton(text: "Logout", onTap: (){},),
          ],
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text("Your Orders" , style: TextStyle(fontSize: 18,),),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SingleProduct(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGUvki1Gmdv7V_RZYYoWy1xAGW8poKgvtyoDUfRc_u2Y5O85MFkwuH0qO9Dcmik5mTBXw"),
            SingleProduct(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLvV1BU1Oh7daRGVomqJKr18PJ0l_389RcTQ"),
          ],
        )
      ]),
    );
  }
}