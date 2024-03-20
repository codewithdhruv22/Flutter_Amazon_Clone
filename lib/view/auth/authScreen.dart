import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import '../../controller/authController.dart';
class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var signUpKey = GlobalKey<FormState>();
  var signInKey = GlobalKey<FormState>();

  void _SignUpsubmit(String email, String name , String password) {
    final isValid = signUpKey.currentState!.validate();
    if (!isValid) {

      return;
    }
    signUpKey.currentState!.save();
       print("I AM WORKING 22222");
    AuthController().signUpUser(context : context,email: email, name: name, password: password);
  }

  void _SignInsubmit() {
    final isValid = signInKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signInKey.currentState!.save();
    print("I AM WORKING 22");
   AuthController().signInUser(context: context, email: emailController.text, password: passwordController.text);
  }

  bool isLoginEnabled = false;

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Amazon Clone"),
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
                            const Text(
                              "Sign in with your email and password.",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Forgot Password",
                                      style: TextStyle(fontSize: 17),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             TextFormField(
                              controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                              validator: (value) {

                                if (value!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Enter a valid email!';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                              
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
                            const SizedBox(height: 10,),
                            TextFormField(
                              controller : passwordController,
                              keyboardType : TextInputType.visiblePassword,
                              validator: (value) {
                                RegExp regex = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else {
                                  if (value.length < 6) {
                                    return 'Enter valid password';
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
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
                            const SizedBox(
                              height: 10,
                            ),
                            CheckboxListTile(
                              value: true,
                              onChanged: (value) {},
                              title: const Text("Show Password"),
                            ),
                            CheckboxListTile(
                              value: true,
                              onChanged: (value) {},
                              title: const Text("Keep singed in."),
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
                                      const BoxDecoration(color: Colors.orangeAccent),
                                  child: const Text("Sign In"),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text("New To Amazon Clone"),
                            const SizedBox(
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
                                  child: const Text("Create a new account"),
                                )),
                            const Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: const Text("Conditions of Use Privacy Notice"))
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
                                const Text(
                                  "Create Account",
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller : nameController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your name";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
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
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller : emailController,
                               keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Enter a valid email!';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
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
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller  : passwordController,
                               keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                RegExp regex = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else {
                                  if (value.length < 6) {
                                    return 'Enter valid password';
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
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
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text("Password must be atleast 6 characters."),
                              ],
                            ),
                            const SizedBox(
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
                                  if (value.length < 6) {
                                    return 'Enter valid password';
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
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
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                                onTap: () {
                                  print("I AM WORKING");
                                  _SignUpsubmit(emailController.text , nameController.text , passwordController.text);
                                } ,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width /
                                                  2 -
                                              100,
                                      vertical: 20),
                                  decoration:
                                      const BoxDecoration(color: Colors.orangeAccent),
                                  child: const Text("Create Account"),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text("Already a customer ?"),
                            const SizedBox(
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
                                  child: const Text("Sign In"),
                                )),
                            const Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
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
