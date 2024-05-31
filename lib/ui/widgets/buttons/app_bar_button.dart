import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final void Function()? onTap;
  final Icon? icon;

  const AppBarButton._({
    this.icon,
    this.onTap,
  });

  factory AppBarButton.backArrow({
    void Function()? onTap,
  }) =>
      AppBarButton._(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onTap: onTap,
      );

  factory AppBarButton.add({
    required Function() onTap,
  }) =>
      AppBarButton._(
        icon: const Icon(
          Icons.add,
        ),
        onTap: onTap,
      );

  factory AppBarButton.remove({
    required Function() onTap,
  }) =>
      AppBarButton._(
        icon: const Icon(
          Icons.remove,
        ),
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    final icon_ = icon;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: _onTap(context),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon_ != null) icon_,
          ],
        ),
      ),
    );
  }

  void Function() _onTap(BuildContext context) => () {
        final callback = onTap;
        callback != null ? callback() : Navigator.of(context).pop();
      };
}
