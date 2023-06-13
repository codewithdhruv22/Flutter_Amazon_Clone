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
  var signUpKey = GlobalKey<FormState>();
  var signInKey = GlobalKey<FormState>();

  void _SignUpsubmit() {
    final isValid = signUpKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signUpKey.currentState!.save();
  }

  void _SignInsubmit() {
    final isValid = signInKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signInKey.currentState!.save();
  }

  bool isLoginEnabled = false;

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
                child: isLoginEnabled
                    ? Form(
                      key: signInKey,
                      child: Column(
                          children: [
                            Text(
                              "Sign in with your email and password.",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 28, fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forgot Password",
                                      style: TextStyle(fontSize: 17),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                             TextFormField(
                            keyboardType: TextInputType.emailAddress,
                              validator: (value) {

                                if (value!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Enter a valid email!';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                              
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red)) ,
                                 errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red)),
                                hintText: "Email",
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              ),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              keyboardType : TextInputType.visiblePassword,
                              validator: (value) {
                                RegExp regex = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else {
                                  if (!regex.hasMatch(value)) {
                                    return 'Enter valid password';
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red)) ,
                                 errorBorder: OutlineInputBorder(
                                  
                                    borderSide:
                                        BorderSide(color: Colors.red)),
                                hintText: "Password",
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                            InkWell(
                                onTap: () => _SignInsubmit(),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width / 2 -
                                              40,
                                      vertical: 20),
                                  decoration:
                                      BoxDecoration(color: Colors.orangeAccent),
                                  child: Text("Sign In"),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text("New To Amazon Clone"),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    isLoginEnabled = false;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width / 2 -
                                              100,
                                      vertical: 20),
                                  decoration:
                                      BoxDecoration(color: Colors.orange[200]),
                                  child: Text("Create a new account"),
                                )),
                            Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: Text("Conditions of Use Privacy Notice"))
                          ],
                        ),
                    )
                    :

                    //SIGN UP SCREEN

                    Form(
                        key: signUpKey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Create Account",
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your name";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                 errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red)),
                                hintText: "Your Name",
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                               keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Enter a valid email!';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red)) ,
                                 errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red)),
                                hintText: "Email",
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                               keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                RegExp regex = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else {
                                  if (!regex.hasMatch(value)) {
                                    return 'Enter valid password';
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red)) ,
                                 errorBorder: OutlineInputBorder(
                                  
                                    borderSide:
                                        BorderSide(color: Colors.red)),
                                hintText: "Password",
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Password must be atleast 6 characters."),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                               keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                RegExp regex = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else {
                                  if (!regex.hasMatch(value)) {
                                    return 'Enter valid password';
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red)) ,
                                hintText: "Re-enter Password",
                                errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                                onTap: () => _SignUpsubmit(),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width /
                                                  2 -
                                              100,
                                      vertical: 20),
                                  decoration:
                                      BoxDecoration(color: Colors.orangeAccent),
                                  child: Text("Create Account"),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text("Already a customer ?"),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    isLoginEnabled = true;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width /
                                                  2 -
                                              40,
                                      vertical: 20),
                                  decoration:
                                      BoxDecoration(color: Colors.orange[200]),
                                  child: Text("Sign In"),
                                )),
                            Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                    "By creating a account you agree Amazon Clone's Coditions of Use and Privacy Notice."))
                          ],
                        ),
                      )),
          ),
        ),
      ),
    );
  }
}
