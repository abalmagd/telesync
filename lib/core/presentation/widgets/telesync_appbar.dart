import 'package:flutter/material.dart';
import 'package:telesync/core/presentation/widgets/theme_switch.dart';

class TelesyncAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TelesyncAppBar({
    super.key,
    this.title,
    this.centerTitle = true,
    this.titleWidget,
    this.leading,
    this.actions,
  });

  final String? title;
  final bool centerTitle;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      title: titleWidget ?? (title == null ? null : Text(title!)),
      leading: leading,
      centerTitle: centerTitle,
      actions: [
        const ThemeSwitch(),
        if (actions != null) ...actions!,
      ],
    );
  }
}
