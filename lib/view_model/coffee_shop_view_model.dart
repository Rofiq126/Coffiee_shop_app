import 'package:coffee_shop_app/model/list_cart_model.dart';
import 'package:coffee_shop_app/view_model/result_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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

  void changeState(ResultState resultState) {
    _resultState = resultState;
    notifyListeners();
  }

  Future addCart(ListCart dataCart) async {
    try {
      changeState(ResultState.loading);
      cartData.add(dataCart);
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

  Future deleteCart(int index) async {
    try {
      changeState(ResultState.loading);
      cartData.removeAt(index);
      message = 'Item deleted';
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
}
