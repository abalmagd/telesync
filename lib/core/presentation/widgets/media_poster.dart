import 'package:flutter/material.dart';

class MediaPoster extends StatelessWidget {
  const MediaPoster({
    super.key,
    required this.poster,
    required this.name,
    required this.year,
  });

  final String poster;
  final String name;
  final String year;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              poster,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(name, style: theme.textTheme.labelLarge),
            const SizedBox(width: 4),
            Text('($year)', style: theme.textTheme.labelSmall),
          ],
        ),
      ],
    );
  }
}
