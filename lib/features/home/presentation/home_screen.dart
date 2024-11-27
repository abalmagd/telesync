import 'package:flutter/material.dart';
import 'package:telesync/core/domain/utils/extensions/string_extention.dart';
import 'package:telesync/core/presentation/widgets/media_poster_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('Movies'.hardcoded, style: theme.textTheme.titleLarge),
        ),
        const SizedBox(height: 18),
        MediaPosterList(
          type: 'Popular',
          media: const [
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
          ],
          onSeeAll: () {},
        ),
        const SizedBox(height: 24),
        MediaPosterList(
          type: 'Trending',
          media: const [
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
          ],
          onSeeAll: () {},
        ),
        const SizedBox(height: 24),
        MediaPosterList(
          type: 'Upcoming',
          media: const [
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
            'https://i.etsystatic.com/41716657/r/il/5a0474/4753892599/il_fullxfull.4753892599_gxcq.jpg',
            'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
            'https://www.photomural.com/media/catalog/product/cache/2/thumbnail/9df78eab33525d08d6e5fb8d27136e95/v/d/vd-046-star-wars-official-poster-ep7.jpg',
          ],
          onSeeAll: () {},
        ),
      ],
    );
  }
}
