import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obsecureText;
  final String? Function(String?) validator;
  final void Function(String?) onSaved;
  final icon;
  const MyTextField({super.key, required this.hintText, this.controller, required this.obsecureText, required this.validator, required this.onSaved, this.icon,});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        onSaved: widget.onSaved,
        validator:widget.validator,
        controller: widget.controller,
        obscureText: widget.obsecureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400)),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
          suffixIcon: widget.icon,
        ),
      ),
    );
  }
}
