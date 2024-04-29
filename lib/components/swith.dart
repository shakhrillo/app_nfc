import 'package:flutter/material.dart';

class SwitchWithText extends StatefulWidget {
  final ValueChanged<bool>? onChanged;

  SwitchWithText({this.onChanged});

  @override
  State<SwitchWithText> createState() => _SwitchWithTextState();
}

class _SwitchWithTextState extends State<SwitchWithText> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xff336699),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: const Color(0xff848484),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: value ? const Color(0xffffffff) : Colors.transparent,
              borderRadius: BorderRadius.circular(40),
            ),
            child: IconButton(
              icon: Icon(
                Icons.check,
                color: value ? Colors.white : Colors.red,
              ),
              onPressed: () {
                setState(() {
                  value = !value;
                  // widget.onChanged!(value);
                });
              },
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: !value ? const Color(0xffffffff) : Colors.transparent,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Text("sfsd"),
          ),
        ],
      ),
    );
  }
}
