import 'package:flutter/material.dart';
import 'package:moviedb_functional/bloc/home_page_bloc.dart';
import 'package:moviedb_functional/constant/colors.dart';
import 'package:moviedb_functional/constant/dimens.dart';
import 'package:moviedb_functional/data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import 'package:moviedb_functional/easy_widget/easy_cached_network_image.dart';
import 'package:moviedb_functional/easy_widget/easy_linear_gradient_container_widget.dart';
import 'package:moviedb_functional/easy_widget/easy_text_widget.dart';
import 'package:moviedb_functional/pages/detail_page.dart';
import 'package:moviedb_functional/utils/extension.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class MovieBannerView extends StatefulWidget {
  const MovieBannerView({
    super.key,
  });

  @override
  State<MovieBannerView> createState() => _MovieBannerViewState();
}

class _MovieBannerViewState extends State<MovieBannerView> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc,List<GetNowPlayingVO>>(
      selector: (_,obj)=>obj.gBannerMovies,
      builder: (context,bannerMovies,child)=>Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          (bannerMovies.isEmpty)
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : SizedBox(
            height: bannerHeight,
            child: PageView.builder(
              controller: _controller,
              itemCount: bannerMovies.length,
              itemBuilder: (context, index) {
                //Movie banners
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(movieId: bannerMovies[index].id ?? 0),
                    ));
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: EasyCachedNetworkImage(
                            img: (bannerMovies[index].backdropPath ?? "")
                                .completeImage(),
                          )),
                      const EasyLinearGradientContainerWidget(),
                      const Positioned.fill(
                          child: Icon(Icons.play_circle,
                              color: kPlayButtonColor,
                              size: bannerPlayButtonSize)),
                      Positioned(
                          bottom: sp25x,
                          left: sp10x,
                          right: sp10x,
                          child: EasyTextWidget(
                            text: '${bannerMovies[index].originalTitle}',
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
            controller: _controller,
            count: bannerMoviesCounts,
            axisDirection: Axis.horizontal,
            onDotClicked: (index) => (index) {
              _controller.animateToPage(index,
                  duration: const Duration(seconds: 1), curve: Curves.ease);
            },
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
      ),
    );
  }
}
