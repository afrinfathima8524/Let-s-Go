
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lets_go/features/authpages/components/my_button.dart';
import 'package:lets_go/features/authpages/components/my_textfield.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();

  late String email;

  void _resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Password reset email sent to $email',style: GoogleFonts.poppins(color:Colors.black,fontWeight:FontWeight.w500,),),
          content:Text("Inside the email, you'll find a link to reset your password. Click the link and follow the provided instructions to set a new password.",
          style: GoogleFonts.poppins(color:Colors.black38,),),
          actions: [
            TextButton(onPressed:(){Navigator.of(context).pop();}, child:Text("Ok",style: GoogleFonts.poppins(color:Colors.blue,fontWeight:FontWeight.bold,),), )
          ],
        );
      },
    );
    } on FirebaseAuthException catch (e)  {
     showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Failed to send password reset: $e',style: GoogleFonts.poppins(color:Colors.black,fontWeight:FontWeight.w500,),),
          actions: [
            TextButton(onPressed:(){Navigator.of(context).pop();}, child:Text("Try again",style: GoogleFonts.poppins(color:Colors.blue,fontWeight:FontWeight.bold,),), )
          ],
        );
      },
    );
       
    }
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 400,
              ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Forget Your Password? don't worry we've got your back",
                        style:GoogleFonts.poppins(fontSize: 20, color: Colors.grey[700]),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    MyTextField(
                      onSaved: (p1) {
                        email = p1!;
                      },
                      validator: _emailValidator,
                      hintText: 'Enter Email',
                      obsecureText: false,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          //print(email);
                          _resetPassword(context);
                        }
                      },
                      text: 'Reset Password',
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already A Member?",style: GoogleFonts.poppins(),),
                        SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Log In",
                            style: GoogleFonts.poppins(color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold)
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
