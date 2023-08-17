import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';

widgetQuantity(
    {required CoffeeShopViewModel viewModel, required VoidCallback function}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
          onPressed: () async {
            await viewModel.reduceQuantity().whenComplete(function);
          },
          icon: const Icon(Icons.remove)),
      Container(
        decoration: BoxDecoration(
            color: Styles.whiteColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            viewModel.quantity.toString(),
            style: Styles.txtTitleMain,
          ),
        ),
      ),
      IconButton(
          onPressed: () async {
            await viewModel.addQuantity().whenComplete(function);
          },
          icon: const Icon(Icons.add)),
    ],
  );
}
