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

  final _formKey = GlobalKey<FormState>();

  late String email,password,confirmPassword;

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
                      "Weclome! to Let's Goo",
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    MyTextField(
                      onSaved: (p0) {
                        email =p0!;
                      },
                      validator: _emailValidator,
                      hintText: 'Enter Email',
                      obsecureText: false,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                       onSaved: (p0) {
                        password =p0!;
                      },
                      validator:_passwordValidator,
                      hintText: 'Enter Password',
                      obsecureText: true,
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                       onSaved: (p0) {
                        confirmPassword =p0!;
                      },
                       validator:_passwordValidator,
                      hintText: "Confirm Password",
                      obsecureText: true,
                      controller: confirmPasswordController,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    MyButton(
                      onTap: () {
                        if(_formKey.currentState!.validate()){
                           
                           _formKey.currentState!.save();
                            logUserIn();
                          }
                       
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
      ),
    );
  }
}
