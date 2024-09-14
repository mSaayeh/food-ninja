import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_ninja/features/home/data/models/promo.dart';

abstract class PromosService {
  Future<List<Promo>> getPromotions();
}

class PromosServiceImpl implements PromosService {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<List<Promo>> getPromotions() async {
    final promotions = await firestore.collection('promos').get();
    return Future.wait(promotions.docs.map((e) async {
      final imageUrl =
          await FirebaseStorage.instance.ref(e['image_url']).getDownloadURL();
      return Promo(
        imageUrl: imageUrl,
        redirectUrl: e['redirect'],
      );
    }).toList());
  }
}
