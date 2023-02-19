import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviedb_functional/constant/colors.dart';
import 'package:moviedb_functional/constant/dimens.dart';
import 'package:moviedb_functional/data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import 'package:moviedb_functional/easy_widget/easy_cached_network_image.dart';
import 'package:moviedb_functional/easy_widget/easy_linear_gradient_container_widget.dart';
import 'package:moviedb_functional/easy_widget/easy_text_widget.dart';
import 'package:moviedb_functional/pages/detail_page.dart';
import 'package:moviedb_functional/utils/extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MovieBannerView extends StatelessWidget {
  const MovieBannerView(
      {super.key,
      required this.controller,
      required this.listMovie,
      required this.onDotClicked});

  final PageController controller;
  final List<GetNowPlayingVO>? listMovie;
  final Function(int) onDotClicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: bannerHeight,
          child: PageView.builder(
            controller: controller,
            itemCount: listMovie?.length,
            itemBuilder: (context, index) {
              //Movie banners
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DetailPage(movieId: listMovie?[index].id??0),)
                  );
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: EasyCachedNetworkImage(
                      img: (listMovie?[index].backdropPath ?? "").completeImage(),
                    )),
                    const EasyLinearGradientContainerWidget(),
                    const Positioned.fill(
                        child: Icon(Icons.play_circle,
                            color: kPlayButtonColor, size: bannerPlayButtonSize)),
                    Positioned(
                        bottom: sp25x,
                        left: sp10x,
                        right: sp10x,
                        child: EasyTextWidget(
                          text: '${listMovie?[index].originalTitle}',
                          fontSize: bannerMovieNameSize,
                          color: bannerMovieNameColor,
                        )),
                  ],
                ),
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: bannerMoviesCounts,
          axisDirection: Axis.horizontal,
          onDotClicked: (index) => onDotClicked(index),
          effect: const ScrollingDotsEffect(
            spacing: sp15x,
            radius: sp4x,
            dotWidth: sp10x,
            dotHeight: sp10x,
            activeDotColor: bannerActiveDotColor,
            paintStyle: PaintingStyle.fill,
          ),
        ),
      ],
    );
  }
}
