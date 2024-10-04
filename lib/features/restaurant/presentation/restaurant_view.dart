import 'package:flutter/material.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Photo Restaurant.png',
            width: double.infinity,
            height: height / 2,
            fit: BoxFit.cover,
          ),
          DraggableScrollableSheet(
            initialChildSize: 13 / 20,
            maxChildSize: 1,
            builder: (context, scrollController) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
