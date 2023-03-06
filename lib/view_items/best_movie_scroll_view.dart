import 'package:flutter/material.dart';
import 'package:moviedb_functional/bloc/home_page_bloc.dart';
import 'package:provider/provider.dart';
import '../data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import '../easy_widget/easy_scrollable_widget.dart';

class BestMovieScrollView extends StatelessWidget {
  const BestMovieScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc,List<GetNowPlayingVO>>(
      selector: (_,obj)=>obj.gBestMovies,
      shouldRebuild: (previous, next) => previous!=next,
      builder: (_,bestMovies,child){
        return Expanded(
        child: bestMovies.isEmpty
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:bestMovies.length,
          controller: context.read<HomePageBloc>().bestMoviesScroll,
          itemBuilder: (context, index) {
            return EasyScrollableWidget(
                movieList: bestMovies, index: index);
          },
        ),
      );}
    );
  }
}

//Consumer<HomePageBloc>(
//       builder: (_,bloc,child){
//         print('comsumer best movies built');
//         return Expanded(
//         child: bloc.gBestMovies.isEmpty
//             ? const Center(
//           child: CircularProgressIndicator(),
//         )
//             : ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: bloc.gBestMovies.length,
//           controller: scrollController,
//           itemBuilder: (context, index) {
//             return EasyScrollableWidget(
//                 movieList: bloc.gBestMovies, index: index);
//           },
//         ),
//       );}
//     );
