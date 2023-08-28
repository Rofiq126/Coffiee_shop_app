import 'package:coffee_shop_app/common/style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final FormFieldValidator<String> validator;
  final Icon icon;
  final Widget? suffix;
  final bool obsecure;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.suffix,
      required this.validator,
      required this.icon,
      required this.obsecure})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.txtReguler,
      controller: widget.controller,
      obscureText: widget.obsecure,
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: widget.label,
        hintStyle: Styles.txtRegulerGrey,
        filled: true,
        fillColor: Styles.whiteColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 1, color: Styles.whiteColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 1, color: Styles.whiteColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 1, color: Colors.redAccent)),
        prefixIcon: widget.icon,
        suffixIcon: widget.suffix,
      ),
    );
  }
}
