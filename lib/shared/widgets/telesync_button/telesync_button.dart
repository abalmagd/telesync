import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:telesync/core/presentation/theme/palette.dart';
part 'primary_button.dart';
part 'secondary_button.dart';

abstract class TelesyncButton extends StatelessWidget {
  const TelesyncButton({super.key});

  factory TelesyncButton.primary({
    required VoidCallback onTap,
    required String title,
    String? svgIcon,
    Icon? icon,
    Color? borderColor,
    Color? fillColor,
    bool enabled = true,
    bool isLoading = false,
  }) {
    return _TelesyncPrimaryButton(
      onTap: onTap,
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
    required VoidCallback onTap,
    required String title,
    String? svgIcon,
    Icon? icon,
    Color? borderColor,
    Color? fillColor,
    bool enabled = true,
    bool isLoading = false,
  }) {
    return _TelesyncSecondaryButton(
      onTap: onTap,
      title: title,
      svgIcon: svgIcon,
      icon: icon,
      borderColor: borderColor,
      fillColor: fillColor,
      enabled: enabled,
      isLoading: isLoading,
    );
  }
}
