import 'package:flutter/material.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/features/cart/presentation/data/models/item_model.dart';
import 'package:food_ninja/features/cart/presentation/widgets/gradient_text.dart';
import 'package:food_ninja/features/cart/presentation/widgets/quantity_button.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key, required this.itemModel});
  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        height: 160,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    itemModel.image!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemModel.name,
                      style: const TextStyle(
                        color: Color(0xff09051C),
                        fontFamily: 'BentonSans',
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      itemModel.restaurantName,
                      style: TextStyle(
                          color: const Color(0xff3B3B3B).withOpacity(0.3),
                          fontFamily: 'BentonSans',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    GradientText(
                      text: r'$ ' '${itemModel.price.toString()}',
                      style: const TextStyle(
                          fontSize: 28,
                          fontFamily: 'BentonSans',
                          fontWeight: FontWeight.w700),
                      gradient: const LinearGradient(
                        colors: [gradientLightGreen, gradientDarkGreen],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 220, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuantityButton(
                        gradientColors: [
                          gradientLightGreen.withOpacity(0.1),
                          gradientDarkGreen.withOpacity(0.1),
                        ],
                        gradientShaderColors: const [
                          gradientLightGreen,
                          gradientDarkGreen
                        ],
                        icon: Icons.remove,
                        iconColor: Colors.white,
                      ),
                      const Text(
                        '1',
                        style: TextStyle(
                            color: Color(0xff5D5D5D),
                            fontFamily: 'Poppins',
                            fontSize: 25),
                      ),
                      const QuantityButton(
                        gradientColors: [gradientLightGreen, gradientDarkGreen],
                        gradientShaderColors: [Colors.white, Colors.white],
                        icon: Icons.add,
                        iconColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
