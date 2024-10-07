import 'dart:ui';

import 'package:flutter/material.dart';

class MealTile extends StatelessWidget {
  const MealTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 50,
            color: const Color(0xff5A6CEA).withOpacity(0.07),
            spreadRadius: 0,
            offset: const Offset(12, 26),
          ),
        ],
      ),
      child: Card(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 16, top: 22, bottom: 17),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: -6,
                    right: -4,
                    child: Opacity(
                      opacity: 0.5,
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Image.asset(
                          'assets/images/image 34.png',
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/image 34.png',
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                'Spacy fresh crab',
                style: TextStyle(
                  color: Color(0xff09051C),
                  fontFamily: 'BentonSans Medium',
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              const Spacer(),
              Text(
                r'12 $',
                style: TextStyle(
                  color: const Color(0xff000000).withOpacity(0.5),
                  fontFamily: 'BentonSans Book',
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
