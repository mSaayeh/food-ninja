import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          child: ShaderMask(
            shaderCallback: (rect) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.transparent,
              ],
            ).createShader(
              Rect.fromLTRB(
                0,
                0,
                rect.width,
                rect.height,
              ),
            ),
            blendMode: BlendMode.dstIn,
            child: SvgPicture(
              const SvgAssetLoader("assets/images/Pattern.svg"),
              height: size.height / 2,
              fit: BoxFit.cover,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
