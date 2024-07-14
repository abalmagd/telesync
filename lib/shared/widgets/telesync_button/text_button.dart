part of 'telesync_button.dart';

class _TelesyncTextButton extends TelesyncButton {
  const _TelesyncTextButton({
    required this.onPressed,
    required this.title,
    this.enabled = true,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final String title;
  final bool enabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextButton(
      onPressed: (isLoading || !enabled) ? null : onPressed,
      child: Visibility(
        visible: !isLoading,
        replacement: const TelesyncProgressIndicator(),
        child: Text(
          title,
          style: textTheme.bodyLarge?.copyWith(),
        ),
      ),
    );
  }
}
