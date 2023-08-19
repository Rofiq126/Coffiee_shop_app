import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/view/auth/login_screen.dart';
import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';

customAppBar(
    {required String name,
    required BuildContext context,
    required CoffeeShopViewModel viewModel}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Styles.primaryColor,
    centerTitle: true,
    title: Text(
      name,
      style: Styles.txtTitleMain,
    ),
    leading: IconButton(
        onPressed: () async {
          showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Styles.brownColor,
                  ),
                );
              });
          Navigator.pop(context);
          await viewModel.signOutUser().then((value) =>
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoginScreen())));
        },
        icon: const Icon(
          Icons.exit_to_app_rounded,
          color: Styles.brownColor,
        )),
  );
}
