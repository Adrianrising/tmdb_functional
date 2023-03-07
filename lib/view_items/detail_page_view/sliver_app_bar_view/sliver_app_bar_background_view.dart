
import 'package:flutter/material.dart';
import 'package:moviedb_functional/data/vos/get_details_vo/get_details_vo.dart';
import 'package:moviedb_functional/easy_widget/easy_linear_gradient_container_widget.dart';
import 'package:moviedb_functional/utils/extension.dart';

import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../easy_widget/easy_cached_network_image.dart';

class SliverAppBarBackgroundView extends StatelessWidget {
  const SliverAppBarBackgroundView({
    super.key,
    required this.detailData,
  });

  final GetDetailsVO? detailData;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: EasyCachedNetworkImage(
            img: (detailData?.backdropPath ?? "").completeImage()),
      ),
      const EasyLinearGradientContainerWidget(),
      Positioned(
          top: sp40x,
          left: sp10x,
          child: CircleAvatar(
            backgroundColor: Colors.black12,
            child: IconButton(
              padding: const EdgeInsets.only(left: sp8x),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          )),
      Positioned(
        top: sp40x,
        right: sp10x,
        child: CircleAvatar(
          backgroundColor: kTransparentColor,
          child: IconButton(
              padding: const EdgeInsets.only(left: sp8x),
              onPressed: () {},
              icon: const Icon(Icons.search, size: fz30)),
        ),
      ),
    ]);
  }
}