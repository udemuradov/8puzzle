// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButtonWidget extends StatelessWidget {
  void Function()? tap;
  final String text;
  AppButtonWidget({Key? key, this.tap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: tap,
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 40)),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ));
  }
}