import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_ninja/features/auth/data/model/user.dart';

class FirestoreAuthHelper {
  static Future<void> createNewUser(AuthedUser user) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.id)
        .set(user.toMap());
  }
}
