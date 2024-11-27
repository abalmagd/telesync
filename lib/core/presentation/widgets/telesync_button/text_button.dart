part of 'telesync_button.dart';

class _TelesyncTextButton extends TelesyncButton {
  const _TelesyncTextButton({
    required super.onPressed,
    required super.title,
    super.enabled = true,
    super.isLoading = false,
    super.icon,
    super.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (isLoading || !enabled) ? null : onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        visualDensity: VisualDensity.compact,
      ),
      child: Visibility(
        visible: !isLoading,
        replacement: const TelesyncLoader(),
        child: Row(
          children: [
            Text(title, style: labelStyle),
            if (icon != null) icon!,
          ],
        ),
      ),
    );
  }
}
