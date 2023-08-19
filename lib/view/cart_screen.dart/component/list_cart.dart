import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop_app/common/style.dart';
import 'package:coffee_shop_app/view_model/coffee_shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCart extends StatefulWidget {
  final VoidCallback function;
  ListCart({Key? key, required this.function}) : super(key: key);

  @override
  State<ListCart> createState() => _ListCartState();
}

class _ListCartState extends State<ListCart> {
  final Stream<QuerySnapshot> dataCartStram =
      FirebaseFirestore.instance.collection('dataCart').snapshots();
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<CoffeeShopViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: dataCartStram,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Something Wrong :(',
                style: Styles.txtTitleBrown,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Styles.brownColor,
              ),
            );
          }
          return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
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
                                    viewModel.cartData[index].quantity
                                        .toString(),
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
                              await viewModel
                                  .deleteCart(
                                    snapshot.data!.docs[index].id,
                                  )
                                  .then((value) =>
                                      viewModel.getDataBinding(context));
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Styles.brownColor,
                            ),
                          ))),
                );
              });
        });
  }
}
