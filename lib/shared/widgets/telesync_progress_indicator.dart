import 'package:flutter/material.dart';

class TelesyncProgressIndicator extends StatelessWidget {
  const TelesyncProgressIndicator({super.key, this.withBackground = false});

  final bool withBackground;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        height: 46,
        width: 46,
        padding: const EdgeInsets.all(12),
        decoration: withBackground
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: theme.colorScheme.onSurface,
              )
            : null,
        child: CircularProgressIndicator(
          color: theme.primaryColor,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
