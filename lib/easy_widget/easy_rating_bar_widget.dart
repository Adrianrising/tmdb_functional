import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constant/dimens.dart';

class EasyRatingBarWidget extends StatelessWidget {
  const EasyRatingBarWidget({Key? key,
  required this.rating}) : super(key: key);

  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: true,
      itemSize: easyScrollStarSize,
      initialRating: rating,
      minRating: easyScrollStarMinRating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: easyScrollStarCount,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate:(rating){},
    );
  }
}
