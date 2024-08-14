import 'package:flutter/material.dart';

class MyFormTextField extends StatelessWidget {
  MyFormTextField({
    super.key,
    required this.hint,
    this.onCahnged,
    this.iconButton,
    this.obscureText = false,
    this.isPassword = false,
  });

  final String hint;
  final Function(String)? onCahnged;
  final IconButton? iconButton;
  final bool obscureText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: TextFormField(
        obscureText: isPassword ? obscureText : false,
        validator: (data) {
          if (data!.isEmpty) {
            return 'Field is required';
          }
          return null;
        },
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
