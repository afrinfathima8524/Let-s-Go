import 'package:flutter/material.dart';
import 'package:lets_go/features/authpages/login.dart';
import 'package:lets_go/features/authpages/signin.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool showLoginPage = false;
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return SignInPage(onTap: togglePage);
    }else{
      return LoginPage(onTap: togglePage);
    }  }
}
