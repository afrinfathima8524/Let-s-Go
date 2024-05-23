import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obsecureText;
  final String? Function(String?) validator;
  final void Function(String?) onSaved;
  const MyTextField({super.key, required this.hintText, this.controller, required this.obsecureText, required this.validator, required this.onSaved,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        onSaved: onSaved,
        validator:validator,
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400)),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500)
        ),
      ),
    );
  }
}
