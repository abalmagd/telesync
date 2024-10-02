part of 'telesync_button.dart';

class _TelesyncSecondaryButton extends TelesyncButton {
  const _TelesyncSecondaryButton({
    required super.onPressed,
    required super.title,
    super.svgIcon,
    super.icon,
    super.borderColor,
    super.fillColor,
    super.enabled = true,
    super.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
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
