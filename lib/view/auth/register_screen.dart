import 'package:coffee_shop_app/common/custom_button.dart';
import 'package:coffee_shop_app/common/custom_textfield..dart';
import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/model/user_data_model.dart';
import 'package:coffee_shop_app/view/auth/component/snackbar_condition.dart';
import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    var viewModel = Provider.of<CoffeeShopViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Styles.primaryColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Styles.brownColor,
            )),
      ),
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
                CustomButton(
                    nameButton: 'Register Me',
                    navigator: () async {
                      showDialog(
                          context: context,
                          builder: (context) => const Center(
                                child: CircularProgressIndicator(
                                  color: Styles.brownColor,
                                ),
                              ));
                      Navigator.pop(context);
                      await viewModel
                          .createUser(
                              userData: UserData(
                                  name: name.text,
                                  email: email.text,
                                  phone: number.text,
                                  password: password.text))
                          .then((value) {
                        if (viewModel.message ==
                            'Account succesfully created') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(Condition.registerSucces);
                          Navigator.pop(context);
                        } else if (viewModel.message ==
                            'Password provided is too weak') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(Condition.registerPasswordWeak);
                        } else if (viewModel.message ==
                            'The account already exists') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(Condition.registerExist);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(Condition.registerFilure);
                        }
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
