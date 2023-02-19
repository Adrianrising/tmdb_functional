import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EasyCachedNetworkImage extends StatelessWidget {
  const EasyCachedNetworkImage({Key? key,
  required this.img}) : super(key: key);

  final String img;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: img,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
