import 'package:flutter/material.dart';
import 'package:telesync/core/domain/utils/extensions/string_extention.dart';
import 'package:telesync/core/presentation/widgets/media_poster.dart';
import 'package:telesync/core/presentation/widgets/telesync_button/telesync_button.dart';

class MediaPosterList extends StatelessWidget {
  const MediaPosterList({
    super.key,
    required this.type,
    required this.media,
    this.onSeeAll,
  });

  final String type;
  final VoidCallback? onSeeAll;
  final List media;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                type,
                style: theme.textTheme.titleSmall,
              ),
              const Spacer(),
              TelesyncButton.text(
                onPressed: () {},
                title: 'See All'.hardcoded,
                labelStyle: theme.textTheme.labelSmall
                    ?.copyWith(color: theme.colorScheme.primary),
                icon: const Icon(Icons.chevron_right_rounded, size: 16),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: size.height * 0.30,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              return MediaPoster(
                poster: media[index],
                name: 'Name',
                year: '2024',
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemCount: media.length,
          ),
        ),
      ],
    );
  }
}
