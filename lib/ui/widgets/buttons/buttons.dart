import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:olearis_test/logic/extensions/extensions.dart';

class AppButtons extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final Color? backgroundColor;
  final bool isLoading;
  final bool isActive;
  final double? width;

  const AppButtons._({
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.isLoading = false,
    this.isActive = true,
    this.width,
  });

  factory AppButtons.primary({
    required String title,
    required void Function() onPressed,
    bool isLoading = false,
    Color? backgroundColor,
    Color? textColor,
    Widget? prefixIcon,
    bool isActive = true,
    double? width,
  }) =>
      AppButtons._(
        title: title,
        onPressed: onPressed,
        isLoading: isLoading,
        backgroundColor: backgroundColor,
        isActive: isActive,
        width: width,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: isActive ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? context.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: !isLoading
            ? Text(
                title,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: isActive ? context.colorScheme.onPrimary : Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ).tr()
            : CircularProgressIndicator(
                color: context.colorScheme.onPrimary,
              ),
      ),
    );
  }
}
