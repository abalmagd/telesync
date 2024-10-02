part of 'telesync_button.dart';

class _TelesyncPrimaryButton extends TelesyncButton {
  const _TelesyncPrimaryButton({
    required super.onPressed,
    required super.title,
    required super.enabled,
    required super.isLoading,
    super.svgIcon,
    super.icon,
    super.borderColor,
    super.fillColor,
  }) : assert(
          (icon == null || svgIcon == null),
          "Only one of icon or svgIcon can be non-null.",
        );

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: (isLoading || !enabled) ? null : onPressed,
      child: isLoading
          ? const TelesyncLoader()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title),
                if (icon != null) ...[const Gap(12), icon!],
                if (svgIcon != null) ...[
                  const Gap(12),
                  SvgPicture.asset(svgIcon!)
                ],
              ],
            ),
    );
  }
}
