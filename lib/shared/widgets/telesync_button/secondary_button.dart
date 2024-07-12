part of 'telesync_button.dart';

class _TelesyncSecondaryButton extends TelesyncButton {
  const _TelesyncSecondaryButton({
    required this.onTap,
    required this.title,
    this.svgIcon,
    this.icon,
    this.borderColor,
    this.fillColor,
    this.enabled = true,
    this.isLoading = false,
  });

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
    return const Placeholder();
  }
}
