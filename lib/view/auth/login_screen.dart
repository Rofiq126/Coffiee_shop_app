import 'package:coffee_shop_app/common/bottom_navigation.dart';
import 'package:coffee_shop_app/common/custom_button.dart';
import 'package:coffee_shop_app/common/custom_textfield..dart';
import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/view/auth/component/button_register.dart';
import 'package:coffee_shop_app/view/auth/component/snackbar_condition.dart';
import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isVisible = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<CoffeeShopViewModel>(context, listen: false).getDataCart();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var viewModel = Provider.of<CoffeeShopViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/icons/coffee-shop.png',
                width: size.width * 0.3,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            const Text(
              'Brew Day',
              style: Styles.txtTitleMain,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'How do you like you\'re coffee?',
              style: Styles.txtReguler,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextField(
                controller: email,
                label: 'Email',
                validator: (value) {
                  if (value == null) {
                    return "Email cannot be empty";
                  }
                  return null;
                },
                icon: const Icon(
                  Icons.email_rounded,
                  color: Styles.greyColor,
                ),
                obsecure: false),
            const SizedBox(height: 16),
            CustomTextField(
                controller: password,
                label: 'Password',
                validator: (value) {
                  if (value == null) {
                    return "Password cannot be empty";
                  }
                  return null;
                },
                icon: const Icon(
                  Icons.lock,
                  color: Styles.greyColor,
                ),
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                    color: Styles.greyColor,
                  ),
                ),
                obsecure: isVisible),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              nameButton: 'Enter Shop',
              navigator: () async {
                await viewModel
                    .signInUser(email: email.text, password: password.text)
                    .then((value) {
                  if (viewModel.message == 'Login success') {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(Condition.loginSuccesfull);
                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const BottomNavBar()));
                    });
                  } else if (viewModel.message ==
                      'No user found for this email') {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(Condition.loginUserNotFound);
                  } else if (viewModel.message == 'Wrong password') {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(Condition.loginWrongPassword);
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(Condition.registerFilure);
                  }
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            buttonRegister(context: context)
          ],
        ),
      ),
    );
  }
}
