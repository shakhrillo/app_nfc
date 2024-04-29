import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    this.label = '',
    required this.controller,
    this.prefixIcon,
    this.labelText,
    this.isPassword = false,
  }) : super(key: key);

  final String? label;
  final TextEditingController controller;
  final bool isPassword;
  final Icon? prefixIcon;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == ''
            ? const SizedBox(height: 0)
            : Text(
                label!,
                style: const TextStyle(
                  color: Color(0xff336699),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            prefixIcon:
                const Icon(Icons.qr_code, color: Color(0xff848484), size: 30),
            labelText: labelText,
            labelStyle: const TextStyle(color: Color(0xff848484), fontSize: 18),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff336699), width: 1.5),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff848484), width: .7),
            ),
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
