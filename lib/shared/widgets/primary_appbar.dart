import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    super.key,
    this.titleText,
    this.centerTitle = true,
    this.titleWidget,
    this.leading,
  }) : assert(
          (titleText != null) ^ (titleWidget != null),
          'You must set either "titleText" or "titleWidget", but not both',
        );

  final String? titleText;
  final bool centerTitle;
  final Widget? titleWidget;
  final Widget? leading;

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? Text(titleText!),
      leading: leading,
      centerTitle: centerTitle,
      actions: const [
        // TODO: Theme switch
      ],
    );
  }
}
