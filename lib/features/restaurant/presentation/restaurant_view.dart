import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ninja/features/restaurant/presentation/heart_icon.dart';
import 'package:food_ninja/features/restaurant/presentation/popular_icon.dart';

class RestaurantView extends StatefulWidget {
  const RestaurantView({super.key});

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  double sheetPosition = 0.6;
  final double dragSensitivity = 600;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Photo Restaurant.png',
            width: double.infinity,
            height: height * 0.55,
            fit: BoxFit.cover,
          ),
          DraggableScrollableSheet(
            initialChildSize: sheetPosition,
            builder: (context, scrollController) {
              return GestureDetector(
                onVerticalDragUpdate: (details) {
                  setState(
                    () {
                      sheetPosition -= details.delta.dy / dragSensitivity;
                      if (sheetPosition < 0.25) {
                        sheetPosition = 0.25;
                      }
                      if (sheetPosition > 1.0) {
                        sheetPosition = 1.0;
                      }
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 24),
                          child: Center(
                            child: Container(
                              width: 100,
                              height: 5,
                              decoration: BoxDecoration(
                                color: const Color(0xffFEF6ED),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PopularIcon(),
                            HeartIcon(),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(
                            'Wijie Bar and Resto',
                            style: TextStyle(
                                fontFamily: 'BentonSans',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff09051C)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 16),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 12),
                                child: Icon(
                                  FontAwesomeIcons.starHalfStroke,
                                  color: Color(0xff2ECF80),
                                  size: 26,
                                ),
                              ),
                              Text(
                                '4,8 Rating',
                                style: TextStyle(
                                  color:
                                      const Color(0xff3B3B3B).withOpacity(0.3),
                                  fontFamily: 'BentonSans Regular',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        LayoutBuilder(
                          builder: (context, constrains) {
                            return SizedBox(
                              width: constrains.maxWidth,
                              child: const Text(
                                'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
                                maxLines: 4,
                                style: TextStyle(
                                  fontFamily: 'BentonSans Book',
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.start,
                                softWrap: true,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
