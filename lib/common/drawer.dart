import 'package:coffee_shop_app/common/style.dart';
import 'package:flutter/material.dart';

drawerCoffee(Size size) {
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
          onTap: () {},
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
