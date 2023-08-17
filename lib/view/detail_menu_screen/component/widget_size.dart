import 'package:coffee_shop_app/common/custom_badge.dart';
import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';

widgetSize(
    {required CoffeeShopViewModel viewModel, required VoidCallback setState}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CustomBadgeSize(
          function: () {
            viewModel.isPressedSize(index: 0).whenComplete(setState);
          },
          name: 'S',
          badgeColor:
              viewModel.isTapped0 ? Styles.brownColor : Styles.whiteColor,
          textColor: viewModel.isTapped0 ? Styles.whiteColor : Styles.greyColor,
          viewModel: viewModel),
      const SizedBox(
        width: 10,
      ),
      CustomBadgeSize(
          function: () {
            viewModel.isPressedSize(index: 1).whenComplete(setState);
          },
          name: 'M',
          badgeColor:
              viewModel.isTapped1 ? Styles.brownColor : Styles.whiteColor,
          textColor: viewModel.isTapped1 ? Styles.whiteColor : Styles.greyColor,
          viewModel: viewModel),
      const SizedBox(
        width: 10,
      ),
      CustomBadgeSize(
          function: () {
            viewModel.isPressedSize(index: 2).whenComplete(setState);
          },
          name: 'L',
          badgeColor:
              viewModel.isTapped2 ? Styles.brownColor : Styles.whiteColor,
          textColor: viewModel.isTapped2 ? Styles.whiteColor : Styles.greyColor,
          viewModel: viewModel),
    ],
  );
}
