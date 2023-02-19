
import 'package:flutter/material.dart';
import 'package:moviedb_functional/data/vos/get_details_vo/get_details_vo.dart';
import 'package:moviedb_functional/easy_widget/easy_text_widget.dart';
import '../constant/dimens.dart';
class MovieGenresNameAndRunTimeView extends StatelessWidget {
  const MovieGenresNameAndRunTimeView({
    super.key,
    required this.detailData,
  });

  final GetDetailsVO? detailData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sp10x),
      child: Wrap(
        spacing: sp5x,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: sp13x),
            child: Icon(Icons.watch_later_outlined,
                color: Colors.amber),
          ),
          Padding(
            padding: const EdgeInsets.only(top: sp13x),
            child: EasyTextWidget(
              text:
              ' ${(detailData?.runtime ?? 0) ~/ 60}hr ${(detailData?.runtime ?? 0) % 60}min',
              fontSize: runTimeFontSize,
            ),
          ),
          for (var obj in detailData?.genres ?? [])
            Chip(
                label: EasyTextWidget(
                  text: '${obj.name ?? ""}',
                  fontSize: genresNameFontSize,
                ),
                backgroundColor: Colors.redAccent),
          const Padding(
            padding: EdgeInsets.only(top: sp11x),
            child: Icon(
              Icons.favorite_border_outlined,
              size: favIconSize,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}