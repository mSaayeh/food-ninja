import 'package:flutter/material.dart';

class PriceInfo extends StatelessWidget {
  const PriceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
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
        Padding(
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
        Padding(
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
        SizedBox(
          height: 30,
        ),
        Padding(
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
      ],
    );
  }
}
