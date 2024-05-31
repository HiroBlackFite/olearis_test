import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:olearis_test/logic/extensions/extensions.dart';

class AppSVGImage extends StatelessWidget {
  final Widget child;
  const AppSVGImage._({required this.child});

  factory AppSVGImage.assets({
    required BuildContext context,
    required String assetName,
  }) =>
      AppSVGImage._(
        child: SvgPicture.asset(
          assetName,
          width: context.screen.width,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 375),
      child: child,
    );
  }
}
