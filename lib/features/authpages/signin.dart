import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_go/features/authpages/components/my_button.dart';
import 'package:lets_go/features/authpages/components/my_textfield.dart';

class SignInPage extends StatefulWidget {
  final Function()? onTap;
  SignInPage({super.key, required this.onTap});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscureText = false;
  bool confirmObscureText = false;
  
  void logUserIn() async {
    // profileEmail = emailController.text;
    // profilePassword = passwordController.text;
    // profileName = usernameController.text;
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        await FirebaseAuth.instance.signOut();
        Navigator.pop(context);
        Navigator.pop(context);
        widget.onTap!();
      } else {
        Navigator.pop(context);
        showErrorMessage("Password DOes'nt macth");
      }
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
                    height: 20,
                  ),
                  MyTextField(
                    icon: IconButton(
                      onPressed: () {
                        setState(() {
                          confirmObscureText = !confirmObscureText;
                        });
                      },
                      icon: Icon(confirmObscureText
                          ? Icons.visibility_off:
                             Icons.visibility,color: confirmObscureText? Colors.black:Colors.blue,),
                    ),
                    hintText: "Confirm Password",
                    obsecureText: confirmObscureText,
                    controller: confirmPasswordController,
                  ),
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
                        onTap: widget.onTap,
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
      ),
    );
  }
}
