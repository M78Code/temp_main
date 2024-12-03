import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final int number;

  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(85),
          elevation: 0.5,
          // padding: EdgeInsets.only(left: 30, right: 30),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          controller.text += number.toString();
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
                // fontWeight: FontWeight.bold,
                color: Color(0xff9ba5be),
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}
