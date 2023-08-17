import 'package:coffee_shop_app/common/bottom_navigation.dart';
import 'package:coffee_shop_app/common/custom_button.dart';
import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/model/list_cart_model.dart';
import 'package:coffee_shop_app/view/detail_menu_screen/component/widget_quantity.dart';
import 'package:coffee_shop_app/view/detail_menu_screen/component/widget_size.dart';
import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailMenuScreen extends StatefulWidget {
  final String name;
  final String description;
  final String pathPicture;
  final String price;
  const DetailMenuScreen(
      {Key? key,
      required this.name,
      required this.price,
      required this.description,
      required this.pathPicture})
      : super(key: key);

  @override
  State<DetailMenuScreen> createState() => _DetailMenuScreenState();
}

class _DetailMenuScreenState extends State<DetailMenuScreen> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var viewModel = Provider.of<CoffeeShopViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Styles.brownColor,
            )),
      ),
      backgroundColor: Styles.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    widget.pathPicture,
                    width: size.width * 0.3,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  widget.name,
                  style: Styles.txtTitleMain,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  widget.description,
                  style: Styles.txtReguler,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Q U A N T I T Y',
                  style: Styles.txtTitleGreyLight,
                ),
                const SizedBox(
                  height: 16,
                ),
                widgetQuantity(
                    viewModel: viewModel,
                    function: () {
                      setState(() {});
                    }),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'S I Z E',
                  style: Styles.txtTitleGreyLight,
                ),
                const SizedBox(
                  height: 16,
                ),
                widgetSize(
                    viewModel: viewModel,
                    setState: () {
                      setState(() {});
                    })
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: size.width,
        decoration: const BoxDecoration(color: Styles.primaryColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: CustomButton(
              nameButton: 'Add to cart',
              navigator: () async {
                await viewModel
                    .addCart(
                      ListCart(
                          name: widget.name,
                          price: widget.price,
                          pathPicture: widget.pathPicture,
                          quantity: viewModel.quantity,
                          size: viewModel.size),
                    )
                    .then((value) => Navigator.pop(context));
                if (viewModel.message == 'Item succesfully added') {
                  // ignore: use_build_context_synchronously
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/icons/checked.png',
                                  width: 80,
                                  height: 80,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  viewModel.message,
                                  style: Styles.txtTitleGrey,
                                ),
                              ],
                            ),
                          ));
                }
                // .then((value) => Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (_) => BottomNavBar())));
              }),
        ),
      ),
    );
  }
}
