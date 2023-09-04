import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop_app/common/custom_appBar.dart';
import 'package:coffee_shop_app/common/custom_button.dart';
import 'package:coffee_shop_app/common/style.dart';
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
  final Stream<QuerySnapshot> dataCartStream =
      FirebaseFirestore.instance.collection('dataCart').snapshots();
  AsyncSnapshot<QuerySnapshot>? snapShot;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var viewModel = Provider.of<CoffeeShopViewModel>(context, listen: false);
    return Scaffold(
        backgroundColor: Styles.primaryColor,
        appBar: customAppBar(
            name: 'Your Cart', context: context, viewModel: viewModel),
        body: StreamBuilder(
            stream: dataCartStream,
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cart',
                          style: Styles.txtTitleGrey,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ListCart()
                      ],
                    ),
                  ),
                );
              } else if (snapshot.data != null && snapshot.data!.docs.isEmpty) {
                return Center(
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
                );
              }
              return Container();
            }),
        bottomSheet: Visibility(
            visible: true,
            child: Container(
                width: size.width,
                decoration: const BoxDecoration(color: Styles.primaryColor),
                child: ListTile(
                  title: const Text(
                    'Total',
                    style: Styles.txtReguler,
                  ),
                  subtitle: Text(
                    '\$ 10.00',
                    style: Styles.txtTitleBrown,
                  ),
                  trailing:
                      CustomButton(nameButton: 'Order Now', navigator: () {}),
                ))));
  }
}
