import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';

class CustomBadgeSize extends StatefulWidget {
  final VoidCallback function;
  final CoffeeShopViewModel viewModel;
  final Color badgeColor;
  final Color textColor;
  final String name;
  const CustomBadgeSize(
      {Key? key,
      required this.function,
      required this.badgeColor,
      required this.textColor,
      required this.name,
      required this.viewModel})
      : super(key: key);

  @override
  State<CustomBadgeSize> createState() => _CustomBadgeSizeState();
}

class _CustomBadgeSizeState extends State<CustomBadgeSize> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.function,
      child: Container(
        width: 50,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: widget.badgeColor),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(
                color: widget.textColor,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
