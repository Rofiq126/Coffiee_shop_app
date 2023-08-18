import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/common/drawer.dart';
import 'package:coffee_shop_app/view/home_screen/component/list_menu.dart';
import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<CoffeeShopViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.primaryColor,
      ),
      drawer: drawerCoffee(size, context, viewModel),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How do you like you\'re coffee?',
              style: Styles.txtTitleGrey,
            ),
            const SizedBox(
              height: 16,
            ),
            listCoffee(size: size, viewModel: viewModel)
          ],
        ),
      ),
    );
  }
}
