import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/view/auth/login_screen.dart';
import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';

drawerCoffee(Size size, BuildContext context, CoffeeShopViewModel viewModel) {
  return Drawer(
    backgroundColor: Styles.primaryColor,
    child: ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Image.asset(
            'assets/icons/coffee-shop-person.png',
            width: size.width * 0.4,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.home,
            color: Styles.greyColor,
          ),
          title: const Text(
            'Home',
            style: Styles.txtRegulerGrey,
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.info_rounded,
            color: Styles.greyColor,
          ),
          title: const Text(
            'About Us',
            style: Styles.txtRegulerGrey,
          ),
        ),
        ListTile(
          onTap: () async {
            showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Styles.brownColor,
                    ),
                  );
                });
            await viewModel.signOutUser().then((value) =>
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginScreen())));
          },
          leading: const Icon(
            Icons.logout_rounded,
            color: Styles.greyColor,
          ),
          title: const Text(
            'Leave',
            style: Styles.txtRegulerGrey,
          ),
        ),
      ],
    ),
  );
}
