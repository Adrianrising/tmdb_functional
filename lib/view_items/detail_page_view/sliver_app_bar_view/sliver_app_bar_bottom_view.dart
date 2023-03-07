import 'package:flutter/material.dart';
import 'package:moviedb_functional/data/vos/get_details_vo/get_details_vo.dart';
import 'package:moviedb_functional/easy_widget/easy_rating_bar_widget.dart';
import 'package:moviedb_functional/easy_widget/easy_text_widget.dart';
import 'package:moviedb_functional/utils/extension.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';

class SliverAppBarBottomView extends StatelessWidget {
  const SliverAppBarBottomView({
    super.key,
    required this.detailData,
  });

  final GetDetailsVO? detailData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: sp10x, right: sp10x, bottom: sp30x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: publishedYearWidth,
                height: publishedYearHeight,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(sp40x),
                ),
                child: Center(
                    child: EasyTextWidget(
                      text: (detailData?.releaseDate ?? "").takeOnlyYear(),
                      fontSize: fz20,
                    )),
              ),
              Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      EasyRatingBarWidget(
                          rating: (detailData?.voteAverage ?? 0) / 2),
                      EasyTextWidget(
                        text: '${detailData?.voteCount} $votesText',
                        fontSize: voteCountFontSize,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  EasyTextWidget(
                    text: '${detailData?.voteAverage}',
                    fontSize: voteAverageFontSize,
                  ),
                ],
              ),
            ],
          ),
          EasyTextWidget(
              text: '${detailData?.originalTitle}', fontSize: movieNameSize),
        ],
      ),
    );
  }
}