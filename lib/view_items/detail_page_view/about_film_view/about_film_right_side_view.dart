import 'package:flutter/material.dart';

import 'package:moviedb_functional/data/vos/get_details_vo/get_details_vo.dart';

import 'package:moviedb_functional/easy_widget/easy_text_widget.dart';

import '../../../constant/dimens.dart';

class AboutFilmRightSideView extends StatelessWidget {
  const AboutFilmRightSideView({
    super.key,
    required this.detailData,
  });

  final GetDetailsVO? detailData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(right: sp10x),
        height: aboutFilmHeight,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EasyTextWidget(
                text: detailData?.originalTitle ?? "",
                fontSize: aboutFilmFontSize,
              ),
              const SizedBox(
                height: sp20x,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var obj in detailData?.genres ?? [])
                      EasyTextWidget(
                        text: '${obj.name ?? ""},',
                        fontSize: aboutFilmFontSize,
                      ),
                  ]
                ),
              ),
              const SizedBox(
                height: sp20x,
              ),
              EasyTextWidget(
                text: detailData
                    ?.productionCountries?[0].name ??
                    "",
                fontSize: aboutFilmFontSize,
              ),
              const SizedBox(
                height: sp20x,
              ),
              EasyTextWidget(
                text: detailData?.releaseDate ?? "",
                fontSize: aboutFilmFontSize,
              ),
              const SizedBox(
                height: sp20x,
              ),
              EasyTextWidget(
                text: detailData?.overview ?? "",
                fontSize: aboutFilmFontSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}