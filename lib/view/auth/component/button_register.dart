import 'package:coffee_shop_app/common/style.dart';
import 'package:flutter/material.dart';

buttonRegister({required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Don\'t have an account?',
        style: Styles.txtReguler,
      ),
      TextButton(
          onPressed: () {},
          child: const Text(
            'Register Now',
            style: Styles.txtRegulerActive,
          ))
    ],
  );
}
