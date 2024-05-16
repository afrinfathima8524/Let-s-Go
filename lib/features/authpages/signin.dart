import 'package:flutter/material.dart';
import 'package:lets_go/features/authpages/components/my_button.dart';
import 'package:lets_go/features/authpages/components/my_textfield.dart';
import 'package:lets_go/features/authpages/login.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  void logUserIn() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/logo.png",
                  height: 200,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Weclome! to Let's Goo",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(
                  height: 50,
                ),
                MyTextField(
                  hintText: 'Enter Email',
                  obsecureText: false,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  hintText: 'Enter Username',
                  obsecureText: false,
                  controller: usernameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(hintText: "Enter Password", obsecureText: true,controller: passwordController,),
                const SizedBox(
                  height: 45,
                ),
                MyButton(
                  onTap: () {
                    logUserIn();
                  },
                  text: 'Sign In',
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already A Member?"),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}