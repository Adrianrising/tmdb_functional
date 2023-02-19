import 'package:flutter/material.dart';

import 'package:moviedb_functional/constant/dimens.dart';

import 'package:moviedb_functional/easy_widget/easy_text_widget.dart';

class MovieShowTimeCardView extends StatelessWidget {
  const MovieShowTimeCardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade900,
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: sp15x,
              left: sp15x,
              child: EasyTextWidget(
                text: 'check movie\nshowtimes'.toUpperCase(),
                fontSize: 26,
              ),
            ),
            const Positioned(
                right: 30,
                top: 60,
                child: Icon(
                  Icons.location_on_rounded,
                  size: 70,
                  color: Colors.white,
                )),
            Positioned(
              bottom: sp15x,
              left: sp15x,
              child: EasyTextWidget(
                text: 'see more'.toUpperCase(),
                color: Colors.amber,
                fontSize: 26,
              ),
            )
          ],
        ),
      ),
    );
  }
}
