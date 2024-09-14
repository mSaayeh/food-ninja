import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/core/widgets/background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundWidget(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset('assets/images/Logo.png'),
                SvgPicture.asset("assets/images/App_Name.svg"),
                const SizedBox(height: 64),
                Text('Sign Up For Free',
                    style: Theme.of(context).textTheme.titleSmall),
                FilledButton(
                    onPressed: () {}, child: const Text('Create Account')),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'already have an account?',
                      style: TextStyle(color: gradientDarkGreen),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
