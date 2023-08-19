import 'package:coffee_shop_app/common/custom_button.dart';
import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/view/auth/login_screen.dart';
import 'package:coffee_shop_app/view/cart_screen.dart/component/list_cart.dart';
import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<CoffeeShopViewModel>(context, listen: false).getId();
    });
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.primaryColor,
        centerTitle: true,
        title: const Text(
          'Your Cart',
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => LoginScreen())));
            },
            icon: const Icon(
              Icons.exit_to_app_rounded,
              color: Styles.brownColor,
            )),
      ),
      body: viewModel.cartData.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/barista.png',
                    width: size.width * 0.4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'You have\'t ordered',
                    style: Styles.txtTitleBrown,
                  )
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Cart',
                      style: Styles.txtTitleGrey,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListCart(
                      function: () {
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
            ),
      bottomSheet: Visibility(
          visible: viewModel.cartData.isEmpty ? false : true,
          child: Container(
              width: size.width,
              decoration: const BoxDecoration(color: Styles.primaryColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 94),
                child: CustomButton(nameButton: 'Order Now', navigator: () {}),
              ))),
    );
  }
}
