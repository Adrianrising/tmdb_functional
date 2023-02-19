import 'package:flutter/material.dart';
import 'package:moviedb_functional/easy_widget/easy_text_widget.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';

class PlayTrailerAndRateMovieButtonsView extends StatelessWidget {
  const PlayTrailerAndRateMovieButtonsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
          const EdgeInsets.only(left: sp10x, right: sp10x),
          child: MaterialButton(
            color: Colors.amber,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(sp40x)),
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.play_circle,
                  color: Colors.black38,
                ),
                EasyTextWidget(
                  text:playTrailerText.toUpperCase(),
                  fontSize: fz17,
                ),
              ],
            ),
          ),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(sp40x),
              side: const BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.white)),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, color: Colors.amber),
              EasyTextWidget(
                text: rateMovieText.toUpperCase(),
                fontSize: fz17,
              ),
            ],
          ),
        )
      ],
    );
  }
}