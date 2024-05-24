import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lets_go/features/authpages/components/my_button.dart';
import 'package:lets_go/features/authpages/components/my_textfield.dart';
import 'package:lets_go/features/authpages/components/square_tile.dart';
import 'package:lets_go/features/authpages/forget_pass.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  final _formKey = GlobalKey<FormState>();

  late String email,password;

  //email validation
   String? _emailValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Email cannot be empty';
      }
      // Simple regex for email validation
      String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value)) {
        return 'Enter a valid email';
      }
      return null;
    }

  //pass validation
   String? _passwordValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Password cannot be empty';
      }
      if (value.length < 8) {
        return 'Password must be at least 8 characters';
      }
      return null;
    }

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
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
                      "Weclome Back You've Been Missed",
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    const SizedBox(
                    height: 25,
                  ),
                    MyTextField(
                      onSaved: (p0) {
                        email= p0!;
                      },
                      validator:_emailValidator,
                      hintText: 'Enter Email',
                      obsecureText: false,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      onSaved: (p0) {
                        password= p0!;
                      },
                      validator: _passwordValidator,
                      icon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,color:obscureText? Colors.black:Colors.blue,),
                    ),
                    hintText: 'Enter Password',
                      obsecureText: obscureText,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPassword(),
                                ));
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
                        if(_formKey.currentState!.validate()){
                         _formKey.currentState!.save();
                          signUserIn();
                        }
                        
                       
                      },
                    text: 'Log In',
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
                          onTap: widget.onTap,
                          child: Text(
                            "Register Now",
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
        ),
      ),
    );
  }
}
