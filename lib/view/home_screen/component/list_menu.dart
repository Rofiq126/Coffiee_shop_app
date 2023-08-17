import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/model/list_coffee_model.dart';
import 'package:coffee_shop_app/view/detail_menu_screen/detail_menu_screen.dart';
import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';

listCoffee({required Size size, required CoffeeShopViewModel viewModel}) {
  return ListView.separated(
      itemCount: dataCoffee.length,
      separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Styles.whiteColor,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ListTile(
                  dense: false,
                  leading: Image.asset(
                    dataCoffee[index].pathPicture,
                    width: size.width * 0.15,
                  ),
                  title: Text(
                    dataCoffee[index].name,
                    style: Styles.txtTitleBrown,
                  ),
                  subtitle: Text(
                    '\$ ${dataCoffee[index].price}',
                    style: Styles.txtReguler,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailMenuScreen(
                                  name: dataCoffee[index].name,
                                  price: dataCoffee[index].price,
                                  description: dataCoffee[index].description,
                                  pathPicture: dataCoffee[index].pathPicture)));
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Styles.brownColor,
                    ),
                  ))),
        );
      });
}
