import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:go_router/go_router.dart';

class HomeSection extends StatelessWidget {
  final String title;
  final String? navigationPath;
  final String? buttonText;
  final Widget child;
  final String? heroTag;
  
  const HomeSection({
    super.key,
    required this.title,
    this.navigationPath,
    this.buttonText,
    required this.child,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              heroTag == null
                  ? Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  : Hero(
                      tag: heroTag!,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
              if (buttonText != null)
                InkWell(
                  onTap: navigationPath == null
                      ? null
                      : () => context.go(navigationPath!),
                  child: Text(
                    buttonText!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: buttonOrange),
                  ),
                )
            ],
          ),
        ),
        child,
      ],
    );
  }
}
