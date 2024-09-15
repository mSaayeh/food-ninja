import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_ninja/features/home/data/models/promotion.dart';

abstract class PromotionsService {
  Future<List<Promotion>> getPromotions();
}

class PromotionsServiceImpl implements PromotionsService {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<List<Promotion>> getPromotions() async {
    final promotions = await firestore.collection('promos').get();
    return Future.wait(promotions.docs.map((e) async {
      final imageUrl =
          await FirebaseStorage.instance.ref(e['image_url']).getDownloadURL();
      return Promotion(
        imageUrl: imageUrl,
        redirectUrl: e['redirect'],
      );
    }).toList());
  }
}
