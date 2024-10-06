import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class CartService {
  Future<void> addToCart(String mealRef, int quantity);
  Future<void> removeFromCart(String mealRef);
}

class CartServiceImpl implements CartService {
  final _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Future<void> addToCart(String mealId, int quantity) async {
    if (user != null) {
      CollectionReference cartRef =
          _firestore.collection('users').doc(user!.uid).collection('cart');

      DocumentReference mealRef = _firestore.collection('meals').doc(mealId);

      DocumentReference cartItemRef = cartRef.doc(mealId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(cartItemRef);

        if (!snapshot.exists) {
          transaction.set(cartItemRef, {
            'meal': mealRef,
            'quantity': quantity,
          });
        } else {
          int newQuantity = snapshot['quantity'] + quantity;
          transaction.update(cartItemRef, {'quantity': newQuantity});
        }
      });
    }
  }

  @override
  Future<void> removeFromCart(String mealRef) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      CollectionReference cartRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('cart');

      await cartRef.doc(mealRef).delete();
    }
  }
}
