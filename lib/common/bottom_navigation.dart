import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/view/cart_screen.dart/cart_screen.dart';
import 'package:coffee_shop_app/view/home_screen/home_screen.dart';
import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  static List<Widget> optionScreen = <Widget>[const HomeScreen(), CartScreen()];
  int selectedIndex = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        var myRecipeViewModel =
            Provider.of<CoffeeShopViewModel>(context, listen: false);
        await myRecipeViewModel.getUid();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: optionScreen.elementAt(selectedIndex),
        ),
        bottomNavigationBar: GNav(
          mainAxisAlignment: MainAxisAlignment.center,
          hoverColor: Colors.grey[300]!,
          rippleColor: Colors.grey[300]!,
          backgroundColor: Styles.primaryColor,
          tabBackgroundColor: Styles.primaryColor,
          color: Colors.grey,
          tabActiveBorder: Border.all(width: 2, color: Styles.whiteColor),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
              textStyle: Styles.txtRegulerGrey,
            ),
            GButton(
              icon: Icons.shopping_bag,
              text: 'Cart',
              textStyle: Styles.txtRegulerGrey,
            ),
          ],
          selectedIndex: selectedIndex,
          onTabChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ));
  }
}
