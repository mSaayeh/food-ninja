import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class CartService {
  Future<void> addToCart(String mealRef, int quantity);
  Future<void> removeFromCart(String mealRef);
}

class CartServiceImpl implements CartService {
  final _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  String _getMealIdFromRef(String mealRef) {
    return mealRef.split('/').last;
  }

  @override
  Future<void> addToCart(String mealRef, int quantity) async {
    if (user != null) {
      CollectionReference cartRef =
          _firestore.collection('users').doc(user!.uid).collection('cart');

      DocumentReference cartItemRef = cartRef.doc(_getMealIdFromRef(mealRef));

      await FirebaseFirestore.instance.runTransaction(
        (transaction) async {
          DocumentSnapshot snapshot = await transaction.get(cartItemRef);

          if (!snapshot.exists) {
            transaction.set(cartItemRef, {
              'meal': _firestore.doc(mealRef),
              'quantity': quantity,
            });
          } else {
            int newQuantity = snapshot['quantity'] + quantity;
            transaction.update(cartItemRef, {'quantity': newQuantity});
          }
        },
      );
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

      await cartRef.doc(_getMealIdFromRef(mealRef)).delete();
    }
  }
}
