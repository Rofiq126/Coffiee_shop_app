import 'package:coffee_shop_app/common/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  String nameButton;
  GestureTapCallback navigator;
  CustomButton({Key? key, required this.nameButton, required this.navigator})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.navigator,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Styles.brownColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          widget.nameButton,
          style: Styles.txtButton,
        ),
      ),
    );
  }
}
