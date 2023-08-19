import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop_app/model/list_cart_model.dart';
import 'package:coffee_shop_app/view_model/result_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeShopViewModel extends ChangeNotifier {
  List<ListCart> cartData = [];
  String message = '';
  int quantity = 0;
  int isPressedIndex = 0;
  bool isTapped0 = false;
  bool isTapped1 = false;
  bool isTapped2 = false;
  String size = '';
  ResultState _resultState = ResultState.loading;
  ResultState get resultState => _resultState;
  var db = FirebaseFirestore.instance;
  DocumentReference? docRef;
  List idIndex = [];
  String id = '';
  void changeState(ResultState resultState) {
    _resultState = resultState;
    notifyListeners();
  }

  Future addCart(ListCart dataCart) async {
    try {
      changeState(ResultState.loading);
      var data = dataCart;
      db
          .collection("dataCart")
          .add(data.listCartToJson())
          .then((DocumentReference doc) {
        debugPrint('DocumentSnapshot added with ID: ${doc.id}');
      });
      await clearData();
      // cartData.add(dataCart);
      message = 'Item succesfully added';
      changeState(ResultState.hasData);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      message = 'Something wrong';
      changeState(ResultState.error);
      notifyListeners();
    }
  }

  Future deleteCart(
    String id,
  ) async {
    getDataCart();
    try {
      changeState(ResultState.loading);
      db.collection('dataCart').doc(id).delete();
      message = 'Item deleted';
      notifyListeners();
      changeState(ResultState.hasData);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      message = 'Something wrong';
      changeState(ResultState.error);
      notifyListeners();
    }
  }

  Future addQuantity() async {
    try {
      quantity += 1;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      notifyListeners();
    }
  }

  Future reduceQuantity() async {
    try {
      quantity -= 1;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      notifyListeners();
    }
  }

  Future isPressedSize({required int index}) async {
    try {
      isPressedIndex = index;
      if (index == 0) {
        isTapped0 = true;
        size = 'Small';
        isTapped1 = false;
        isTapped2 = false;
        notifyListeners();
      } else if (index == 1) {
        isTapped1 = true;
        size = 'Medium';
        isTapped0 = false;
        isTapped2 = false;
        notifyListeners();
      } else {
        isTapped2 = true;
        size = 'Large';
        isTapped1 = false;
        isTapped0 = false;
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
      notifyListeners();
    }
  }

  Future signInUser({required String email, required String password}) async {
    try {
      changeState(ResultState.loading);
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      changeState(ResultState.hasData);
      message = 'Login success';
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      message = 'Something wrong';
      notifyListeners();
    }
  }

  Future signOutUser() async {
    try {
      changeState(ResultState.loading);
      FirebaseAuth.instance.signOut();
      changeState(ResultState.hasData);
      message = 'Signout succes';
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      message = 'Something wrong';
      notifyListeners();
    }
  }

  Future getDataCart() async {
    cartData.clear();
    try {
      changeState(ResultState.loading);
      var data = await db.collection('dataCart').get();
      for (var doc in data.docs) {
        cartData.add(ListCart.fromJson(doc.data()));
        changeState(ResultState.hasData);
        notifyListeners();
      }
      changeState(ResultState.noData);
      notifyListeners();
    } catch (e) {
      changeState(ResultState.error);
      debugPrint(e.toString());
      notifyListeners();
    }
  }

  Future getId() async {
    idIndex.clear();
    var data = db.collection('dataCart');
    await for (var snapShot in data.snapshots()) {
      for (var document in snapShot.docs) {
        idIndex.add(document.id);
        notifyListeners();
      }
    }
  }

  void getDataBinding(BuildContext context) {
    cartData.clear();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<CoffeeShopViewModel>(context, listen: false).getDataCart();
      notifyListeners();
    });
  }

  Future clearData() async {
    quantity = 0;
    isTapped0 = false;
    isTapped1 = false;
    isTapped2 = false;
    notifyListeners();
  }
}
