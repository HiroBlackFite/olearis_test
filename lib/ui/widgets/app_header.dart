import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:olearis_test/logic/extensions/extensions.dart';
import 'package:olearis_test/ui/widgets/widget.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool withBackButton;
  final List<Widget>? action;

  const AppHeader({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.withBackButton = false,
    this.action,
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: context.colorScheme.onPrimary,
      ),
      leading: withBackButton ? AppBarButton.backArrow() : const SizedBox.shrink(),
      actions: action,
      backgroundColor: context.colorScheme.primary,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.onPrimary,
        ),
      ).tr(),
    );
  }
}
