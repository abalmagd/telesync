part of 'telesync_button.dart';

class _TelesyncTextButton extends TelesyncButton {
  const _TelesyncTextButton({
    required super.onPressed,
    required super.title,
    super.enabled = true,
    super.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (isLoading || !enabled) ? null : onPressed,
      child: Visibility(
        visible: !isLoading,
        replacement: const TelesyncLoader(),
        child: Text(title),
      ),
    );
  }
}
