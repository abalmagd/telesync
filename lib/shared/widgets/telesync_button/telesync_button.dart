import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:telesync/core/presentation/theme/palette.dart';
import 'package:telesync/shared/widgets/telesync_progress_indicator.dart';

part 'primary_button.dart';
part 'secondary_button.dart';
part 'text_button.dart';

abstract class TelesyncButton extends StatelessWidget {
  const TelesyncButton({super.key});

  factory TelesyncButton.primary({
    required VoidCallback onPressed,
    required String title,
    String? svgIcon,
    Icon? icon,
    Color? borderColor,
    Color? fillColor,
    bool enabled = true,
    bool isLoading = false,
  }) {
    return _TelesyncPrimaryButton(
      onPressed: onPressed,
      title: title,
      svgIcon: svgIcon,
      icon: icon,
      borderColor: borderColor,
      fillColor: fillColor,
      enabled: enabled,
      isLoading: isLoading,
    );
  }

  factory TelesyncButton.secondary({
    required VoidCallback onPressed,
    required String title,
    String? svgIcon,
    Icon? icon,
    Color? borderColor,
    Color? fillColor,
    bool enabled = true,
    bool isLoading = false,
  }) {
    return _TelesyncSecondaryButton(
      onPressed: onPressed,
      title: title,
      svgIcon: svgIcon,
      icon: icon,
      borderColor: borderColor,
      fillColor: fillColor,
      enabled: enabled,
      isLoading: isLoading,
    );
  }

  factory TelesyncButton.text({
    required VoidCallback onPressed,
    required String title,
    bool enabled = true,
    bool isLoading = false,
  }) {
    return _TelesyncTextButton(
      onPressed: onPressed,
      title: title,
      enabled: enabled,
      isLoading: isLoading,
    );
  }
}
