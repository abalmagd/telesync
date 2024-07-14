part of 'telesync_button.dart';

class _TelesyncSecondaryButton extends TelesyncButton {
  const _TelesyncSecondaryButton({
    required this.onPressed,
    required this.title,
    this.svgIcon,
    this.icon,
    this.borderColor,
    this.fillColor,
    this.enabled = true,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
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
    return OutlinedButton(
      onPressed: (isLoading || !enabled) ? null : onPressed,
      child: Visibility(
        visible: !isLoading,
        replacement: const TelesyncProgressIndicator(),
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
      ),
    );
  }
}
