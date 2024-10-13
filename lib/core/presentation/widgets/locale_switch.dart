import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:telesync/core/domain/localization/supported_locales.dart';

class LocaleSwitch extends StatelessWidget {
  const LocaleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showMenu(
          context: context,
          position: RelativeRect.fromDirectional(
            textDirection: Directionality.of(context),
            start: 16,
            top: kToolbarHeight,
            end: 0,
            bottom: 0,
          ),
          items: SupportedLocales.supportedLocales.values.map((locale) {
            return PopupMenuItem(
              onTap: () => context.setLocale(locale),
              child: Text(locale.languageCode),
            );
          }).toList(),
        );
      },
      icon: const Icon(Icons.language),
    );
  }
}
