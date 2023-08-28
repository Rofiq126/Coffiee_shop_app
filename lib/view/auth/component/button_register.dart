import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/view/auth/register_screen.dart';
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
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const RegisterScreen()));
          },
          child: const Text(
            'Register Now',
            style: Styles.txtRegulerActive,
          ))
    ],
  );
}
