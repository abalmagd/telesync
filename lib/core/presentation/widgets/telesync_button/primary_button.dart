part of 'telesync_button.dart';

class _TelesyncPrimaryButton extends TelesyncButton {
  const _TelesyncPrimaryButton({
    required this.onPressed,
    required this.title,
    required this.enabled,
    required this.isLoading,
    this.svgIcon,
    this.icon,
    this.borderColor,
    this.fillColor,
  }) : assert(
          (icon == null || svgIcon == null),
          "Only one of icon or svgIcon can be non-null.",
        );

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
    return FilledButton(
      onPressed: (isLoading || !enabled) ? null : onPressed,
      child: Visibility(
        visible: !isLoading,
        // replacement: const TelesyncProgressIndicator(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            if (icon != null) ...[const Gap(12), icon!],
            if (svgIcon != null) ...[const Gap(12), SvgPicture.asset(svgIcon!)],
          ],
        ),
      ),
    );
  }
}
