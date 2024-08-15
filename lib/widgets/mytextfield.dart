import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.hint,
    this.onCahnged,
    this.iconButton,
    this.obscureText = false,
    this.isPassword = false,
    this.typeOfText,
  });

  final String hint;
  final Function(String)? onCahnged;
  final IconButton? iconButton;
  final bool obscureText;
  final bool isPassword;
  final TextInputType? typeOfText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: TextField(
        obscureText: isPassword ? obscureText : false,
        keyboardType: typeOfText,
        // validator: (data) {
        //   if (data!.isEmpty) {
        //     return 'Field is required';
        //   }
        //   return null;
        // },
        cursorErrorColor: Colors.red,
        onChanged: onCahnged,
        style: const TextStyle(),
        cursorColor: Colors.blueGrey,
        decoration: InputDecoration(
          suffixIcon: isPassword ? iconButton : null,
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
