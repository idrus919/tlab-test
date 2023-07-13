import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlab_test/constans/theme.dart';
import 'package:tlab_test/controller.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMDB Popular Films'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildList,
          ),
          const SliverToBoxAdapter(
            child: SafeArea(child: SizedBox()),
          ),
        ],
      ),
    );
  }

  Widget get _buildList {
    final controller = MyController.find;

    return Obx(() {
      final movies = controller.movies.value ?? [];

      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final movie = movies[index];

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: secondaryColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: movie?.image ?? '',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.image);
                  },
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie?.title ?? ''),
                      Text(movie?.year ?? ''),
                      Text(movie?.imDbRating ?? ''),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemCount: movies.length,
      );
    });
  }
}
