import 'package:flutter/material.dart';
import 'package:moviedb_functional/constant/colors.dart';
import 'package:moviedb_functional/constant/dimens.dart';
import 'package:moviedb_functional/constant/strings.dart';
import 'package:moviedb_functional/data/apply/tmdb_apply.dart';
import 'package:moviedb_functional/data/apply/tmdb_apply_impl.dart';
import 'package:moviedb_functional/data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import 'package:moviedb_functional/easy_widget/easy_cached_network_image.dart';
import 'package:moviedb_functional/easy_widget/easy_scroll_person_widget.dart';
import 'package:moviedb_functional/view_items/best_actors_view.dart';
import 'package:moviedb_functional/view_items/show_case_view.dart';

import '../view_items/best_popular_movie_item_view.dart';
import '../view_items/movie_banner_view.dart';
import '../view_items/movie_show_time_card_view.dart';
import '../view_items/movies_by_genres_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();
  final TmdbApply tmDbApply = TmdbApplyImpl();

  // List<GetMoviesByGenresVO> moviesByGenre=[];
  @override
  void initState() {

    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        centerTitle: true,
        title: const Text('Discover'),
        leading: const Icon(Icons.menu, size: fz30),
        actions: const [Icon(Icons.search, size: fz30), SizedBox(width: sp30x)],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //banner section
            SizedBox(
              height: 230,
              child: FutureBuilder<List<GetNowPlayingVO>?>(
                future: tmDbApply.getNowPlaying(1),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const EasyCachedNetworkImage(img: defaultImg);
                  }
                  var listMovie = snapshot.data?.take(5).toList();
                  return MovieBannerView(
                    controller: _controller,
                    listMovie: listMovie,
                    onDotClicked: (index) {
                      _controller.animateToPage(index,
                          duration: const Duration(seconds: 1),
                          curve: Curves.ease);
                    },
                  );
                },
              ),
            ),
            const BestPopularMovieItemView(),

            //show time card
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: sp7x, vertical: sp20x),
              child: MovieShowTimeCardView(),
            ),

            const MoviesByGenresView(),

            const SizedBox(height: sp20x),

            const ShowCaseView(),

            const BestActorsView(),

            const SizedBox(height: sp10x),
          ],
        ),
      ),
    );
  }
}
