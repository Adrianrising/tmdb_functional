import 'package:flutter/material.dart';
import 'package:moviedb_functional/easy_widget/easy_text_widget.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
class AboutFilmLeftSideView extends StatelessWidget {
  const AboutFilmLeftSideView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: aboutFilmLeftSideWidth,
      height: aboutFilmHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          EasyTextWidget(
            text:originalTitleText,
            fontSize: aboutFilmFontSize,
            color: Colors.grey,
          ),
          SizedBox(
            height: sp20x,
          ),
          EasyTextWidget(
            text: typeText,
            fontSize: aboutFilmFontSize,
            color: Colors.grey,
          ),
          SizedBox(
            height: sp20x,
          ),
          EasyTextWidget(
            text: productionText,
            fontSize: aboutFilmFontSize,
            color: Colors.grey,
          ),
          SizedBox(
            height: sp20x,
          ),
          EasyTextWidget(
            text: premiereText,
            fontSize: aboutFilmFontSize,
            color: Colors.grey,
          ),
          SizedBox(
            height: sp20x,
          ),
          EasyTextWidget(
            text: descriptionText,
            fontSize: aboutFilmFontSize,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}