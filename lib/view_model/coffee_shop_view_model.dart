import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop_app/model/list_cart_model.dart';
import 'package:coffee_shop_app/model/user_data_model.dart';
import 'package:coffee_shop_app/view_model/result_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CoffeeShopViewModel extends ChangeNotifier {
  List<ListCartModel> cartData = [];
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
  FirebaseAuth auth = FirebaseAuth.instance;
  String id = 'null';
  final Stream<QuerySnapshot> dataCartStream =
      FirebaseFirestore.instance.collection('dataCart').snapshots();
  void changeState(ResultState resultState) {
    _resultState = resultState;
    notifyListeners();
  }

  Future addCart(ListCartModel dataCart) async {
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
    } catch (e) {
      debugPrint(e.toString());
      message = 'Something wrong';
      changeState(ResultState.error);
    }
    notifyListeners();
  }

  Future deleteCart(
    String id,
  ) async {
    try {
      changeState(ResultState.loading);
      db.collection('dataCart').doc(id).delete();
      message = 'Item deleted';
      changeState(ResultState.hasData);
    } catch (e) {
      debugPrint(e.toString());
      message = 'Something wrong';
      changeState(ResultState.error);
    }
    notifyListeners();
  }

  Future addQuantity() async {
    try {
      quantity += 1;
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  Future reduceQuantity() async {
    try {
      quantity -= 1;
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  Future isPressedSize({required int index}) async {
    try {
      isPressedIndex = index;
      if (index == 0) {
        isTapped0 = true;
        size = 'Small';
        isTapped1 = false;
        isTapped2 = false;
      } else if (index == 1) {
        isTapped1 = true;
        size = 'Medium';
        isTapped0 = false;
        isTapped2 = false;
      } else {
        isTapped2 = true;
        size = 'Large';
        isTapped1 = false;
        isTapped0 = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  Future createUser({required UserData userData}) async {
    try {
      changeState(ResultState.loading);
      var users = db.collection('Users');
      await auth
          .createUserWithEmailAndPassword(
              email: userData.email, password: userData.password)
          .then((value) => users.add(userData.userDataToJson()));
      message = 'Account succesfully created';
    } on FirebaseAuthException catch (e) {
      changeState(ResultState.error);
      if (e.code == 'weak-password') {
        message = 'Password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists';
      } else if (e.code == 'invalid-email') {
        message = 'email invalid';
      } else {
        debugPrint(e.toString());
      }
      notifyListeners();
    }
  }

  Future getUid() async {
    auth.authStateChanges().listen((user) {
      if (user != null) {
        id = user.uid;
      } else {
        debugPrint('Something wrong');
      }
      notifyListeners();
    });
  }

  Future signInUser({required String email, required String password}) async {
    try {
      changeState(ResultState.loading);
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => getUid());
      changeState(ResultState.hasData);
      message = 'Login success';
    } on FirebaseAuthException catch (e) {
      changeState(ResultState.error);
      if (e.code == 'user-not-found') {
        message = 'No user found for this email';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password';
      } else if (e.code == 'invalid-email') {
        message = 'email invalid';
      } else {
        debugPrint(e.toString());
      }
      notifyListeners();
    }
  }

  Future signOutUser() async {
    try {
      changeState(ResultState.loading);
      FirebaseAuth.instance.signOut();
      changeState(ResultState.hasData);
      message = 'Signout succes';
    } catch (e) {
      debugPrint(e.toString());
      message = 'Something wrong';
    }
    notifyListeners();
  }

  Future clearData() async {
    quantity = 0;
    isTapped0 = false;
    isTapped1 = false;
    isTapped2 = false;
    notifyListeners();
  }
}
