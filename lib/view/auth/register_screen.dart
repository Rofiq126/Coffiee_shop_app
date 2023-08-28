import 'package:coffee_shop_app/common/custom_button.dart';
import 'package:coffee_shop_app/common/custom_textfield..dart';
import 'package:coffee_shop_app/common/style.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/coffee-beans.png',
                  width: size.width * 0.3,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'REGISTER',
                  style: Styles.txtTitleMain,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'We are happy to see you here',
                  style: Styles.txtReguler,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                    controller: name,
                    label: 'Username',
                    validator: (value) {
                      return null;
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Styles.greyColor,
                    ),
                    obsecure: false),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    controller: email,
                    label: 'Email',
                    validator: (value) {
                      return null;
                    },
                    icon: const Icon(
                      Icons.email,
                      color: Styles.greyColor,
                    ),
                    obsecure: false),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    controller: number,
                    label: 'Phone Number',
                    validator: (value) {
                      return null;
                    },
                    icon: const Icon(
                      Icons.call,
                      color: Styles.greyColor,
                    ),
                    obsecure: false),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    controller: password,
                    label: 'Password',
                    validator: (value) {
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
                CustomButton(nameButton: 'Register Me', navigator: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
