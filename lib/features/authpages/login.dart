import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lets_go/features/authpages/components/my_button.dart';
import 'package:lets_go/features/authpages/components/my_textfield.dart';
import 'package:lets_go/features/authpages/components/square_tile.dart';
import 'package:lets_go/features/authpages/forget_pass.dart';
import 'package:lets_go/features/authpages/signin.dart';
import 'package:lets_go/features/home/ui/home.dart';
import 'package:lets_go/features/profile/data/profile_list.dart';

import '../home/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset("assets/logo.png",height: 200,),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Weclome Back You've Been Missed",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 25,),
                  MyTextField(
                    hintText: 'Enter Username',
                    obsecureText: false,
                    controller: usernameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    hintText: 'Enter Password',
                    obsecureText: true,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword(),));
                          },
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyButton(
                    onTap: () {
                      signUserIn();

                      if(profileName == usernameController.text && profilePassword == passwordController.text){
                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(),));
                      }
                    }, text: 'Log In',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: .5,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "or continue with",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: .5,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(imagepath: "assets/google.png"),
                      SizedBox(
                        width: 25,
                      ),
                      SquareTile(imagepath: "assets/apple.png"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Not A member?"),
                      SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(),));
                        },
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
