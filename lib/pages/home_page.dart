import 'package:flutter/material.dart';
import 'package:moviedb_functional/bloc/home_page_bloc.dart';
import 'package:moviedb_functional/constant/colors.dart';
import 'package:moviedb_functional/constant/dimens.dart';
import 'package:moviedb_functional/view_items/best_actors_view.dart';
import 'package:moviedb_functional/view_items/show_case_view.dart';
import 'package:provider/provider.dart';

import '../view_items/best_popular_movie_item_view.dart';
import '../view_items/movie_banner_view.dart';
import '../view_items/movie_show_time_card_view.dart';
import '../view_items/movies_by_genres_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        centerTitle: true,
        title: const Text('Discover'),
        leading: const Icon(Icons.menu, size: fz30),
        actions: const [Icon(Icons.search, size: fz30), SizedBox(width: sp30x)],
      ),
      body: ChangeNotifierProvider<HomePageBloc>(
        create: (_)=>HomePageBloc(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              //banner section
              SizedBox(
                  height: bannerWholeSectionHeight, child: MovieBannerView()),

              BestPopularMovieItemView(),

              //show time card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sp7x, vertical: sp20x),
                child: MovieShowTimeCardView(),
              ),

              MoviesByGenresView(),

              SizedBox(height: sp20x),

              ShowCaseView(),

              BestActorsView(),

              SizedBox(height: sp10x),
            ],
          ),
        ),
      ),
    );
  }
}
