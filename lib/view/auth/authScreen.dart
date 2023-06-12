import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amazon Clone"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 150,
              child: Column(
                      
                children: [
                  Text(
                    "Sign in with your email and password.",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sign In",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(fontSize: 17),
                          ))
                    ],
                  ),
                     SizedBox(height:10,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                            
                            ),
                  ),
               TextField(
                obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                            
                            ),
                  ),
                     SizedBox(height: 10,),
                  CheckboxListTile(
                    value: true,
                    onChanged: (value) {},
                    title: Text("Show Password"),
                  ),
                  CheckboxListTile(
                    value: true,
                    onChanged: (value) {},
                    title: Text("Keep singed in."),
                  ),
                    InkWell
                    (onTap: (){
              print("CLICK");
                    },child: Container(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/2-40, vertical: 20), decoration: BoxDecoration(color: Colors.orangeAccent),child: Text("Sign In"),)),
               SizedBox(height: 20,),
                  Divider(thickness: 1,),
                     SizedBox(height: 6,),
                  Text("New To Amazon Clone"),
                    SizedBox(height: 15,),
                        InkWell
                    (onTap: (){
              print("CLICK");
                    },child: Container(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/2-100, vertical: 20), decoration: BoxDecoration(color: Colors.orange[200]),child: Text("Create a new account"),)),
                    Spacer(),
                    TextButton(onPressed: (){}, child: Text("Conditions of Use Privacy Notice"))
                ],
                      
              
              ),
            ),
          ),
        ),
      ),
    );
  }
}
