import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';

listCart(
    {required Size size,
    required CoffeeShopViewModel viewModel,
    required VoidCallback function}) {
  return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: viewModel.cartData.length,
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
                    viewModel.cartData[index].pathPicture,
                    width: size.width * 0.15,
                  ),
                  title: Text(
                    viewModel.cartData[index].name,
                    style: Styles.txtTitleBrown,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '\$ ${viewModel.cartData[index].price}',
                        style: Styles.txtReguler,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.coffee,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            viewModel.cartData[index].quantity.toString(),
                            style: Styles.txtReguler,
                          ),
                        ],
                      ),
                      Text(
                        viewModel.cartData[index].size,
                        style: Styles.txtReguler,
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      await viewModel.deleteCart(index).whenComplete(function);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Styles.brownColor,
                    ),
                  ))),
        );
      });
}
