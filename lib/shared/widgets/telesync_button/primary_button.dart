part of 'telesync_button.dart';

class _TelesyncPrimaryButton extends TelesyncButton {
  const _TelesyncPrimaryButton({
    required this.onTap,
    required this.title,
    this.svgIcon,
    this.icon,
    this.borderColor,
    this.fillColor,
    this.enabled = true,
    this.isLoading = false,
  }) : assert(
          (icon == null || svgIcon == null),
          "Only one of icon or svgIcon can be non-null.",
        );

  final VoidCallback onTap;
  final String title;
  final String? svgIcon;
  final Icon? icon;
  final Color? borderColor;
  final Color? fillColor;
  final bool enabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FilledButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: Palette.onPrimary,
            ),
          ),
          if (icon != null) ...[const Gap(12), icon!],
          if (svgIcon != null) ...[const Gap(12), SvgPicture.asset(svgIcon!)],
        ],
      ),
    );
  }
}
