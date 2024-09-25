import 'package:flutter/material.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/core/widgets/background_widget.dart';
import 'package:food_ninja/features/cart/presentation/widgets/custom_back_button.dart';
import 'package:food_ninja/features/cart/presentation/data/models/item_model.dart';
import 'package:food_ninja/features/cart/presentation/widgets/gradient_text.dart';
import 'package:food_ninja/features/cart/presentation/widgets/item_tile.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  List<ItemModel> items = [
    ItemModel(
      image: 'assets/images/Menu Photo1.png',
      name: 'Spacy fresh crab',
      restaurantName: 'Waroenk kita',
      price: 35,
    ),
    ItemModel(
      image: 'assets/images/Menu Photo2.png',
      name: 'Spacy fresh crab',
      restaurantName: 'Waroenk kita',
      price: 35,
    ),
    ItemModel(
      image: 'assets/images/Menu Photo3.png',
      name: 'Spacy fresh crab',
      restaurantName: 'Waroenk kita',
      price: 35,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CustomBackButton(),
              ],
            ),
            const SizedBox(
              height: 23,
            ),
            const Text(
              'Order details',
              style: TextStyle(
                fontFamily: 'BentonSans',
                fontWeight: FontWeight.w400,
                color: Color(0xff09051C),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext, int) {
                  return ItemTile(
                    itemModel: items[int],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 110),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      colors: [gradientLightGreen, gradientDarkGreen],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sub-Total',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'BentonSans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19),
                                ),
                                Text(
                                  '120' r' $',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'BentonSans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery Charge',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'BentonSans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19),
                                ),
                                Text(
                                  '10' r' $',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'BentonSans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discount',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'BentonSans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19),
                                ),
                                Text(
                                  '20' r' $',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'BentonSans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'BentonSans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19),
                                ),
                                Text(
                                  '110' r'$',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'BentonSans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: GestureDetector(
                              child: Container(
                                height: 80,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: GradientText(
                                    text: 'Place My Order',
                                    style: TextStyle(fontSize: 20),
                                    gradient: LinearGradient(
                                        colors: [
                                          gradientLightGreen,
                                          gradientDarkGreen,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
