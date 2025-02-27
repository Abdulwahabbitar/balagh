import 'package:flutter/material.dart';

import '../theme_color/theme_light_color.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            ThemeLightColor.primaryLight,
            ThemeLightColor.primaryDark
          ],
          stops:[0,0.5],
          radius: 0.85,
        ),
      ),
      child: child,
    );
  }
}
