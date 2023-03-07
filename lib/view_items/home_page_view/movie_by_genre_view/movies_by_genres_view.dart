import 'package:flutter/material.dart';
import 'package:moviedb_functional/bloc/home_page_bloc.dart';
import 'package:moviedb_functional/constant/dimens.dart';
import 'package:provider/provider.dart';
import '../../../data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import '../../../easy_widget/easy_scrollable_widget.dart';

class MoviesByGenresView extends StatelessWidget {
  const MoviesByGenresView({Key? key}) : super(key: key);

  // @override
  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc,List<GetNowPlayingVO>>(
      selector: (_,obj)=>obj.gMovieByGenre,
      shouldRebuild: (previous, next) => previous!=next,
      builder: (context, moviesByGenre, child){
        return DefaultTabController(
          length: context.read<HomePageBloc>().gGenre.length,
          child: SizedBox(
            height: moviesByGenreSectionHeight,
            width: double.infinity,
            child: Column(
              children: [

                //tab bar
                TabBar(
                  indicatorColor: Colors.amber,
                  isScrollable: true,
                  tabs: context.read<HomePageBloc>().gGenre.map((e) => Tab(text: e.name)).toList(),
                  onTap: (index) =>context.read<HomePageBloc>().onTapGenre(index)// tmDbApply
                  //     .getMoviesByGenre(genre[index].id ?? 0, page)
                  //     .then((value) {
                  //   setState(() {
                  //     moviesByGenre = value ?? [];
                  //   });
                  // }),
                ),

                //tab bar view
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: sp15x),
                    color: Colors.blueGrey.shade900,
                    child: TabBarView(
                      children: [
                        for (var i = 0; i <  context.read<HomePageBloc>().gGenre.length; i++)
                          ListView.builder(
                            controller:  context.read<HomePageBloc>().genreMoviesScroll,
                            scrollDirection: Axis.horizontal,
                            itemCount: moviesByGenre.length,
                            itemBuilder: (context, index) {
                              return EasyScrollableWidget(
                                index: index,
                                genreMovies: moviesByGenre,
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

//Column(
//         children: [
//           TabBar(
//             isScrollable: true,
//             tabs: genre.map((e) => Tab(text: e.name)).toList(),
//             onTap: (index) => tmDbApply
//                 .getMoviesByGenre(genre[index].id ?? 0, page)
//                 .then((value) {
//               setState(() {
//                 moviesByGenre = value ?? [];
//               });
//             }),
//           ),
//           Container(
//             color: Colors.blueGrey.shade900,
//             width: double.infinity,
//             height: 250,
//             child: TabBarView(
//               children: [
//                 for (var i = 0; i < genre.length; i++)
//                   ListView.builder(
//                     controller: scrollController,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: moviesByGenre.length,
//                     itemBuilder: (context, index) {
//                       return EasyScrollableWidget(
//                         index: index,
//                         genreMovies: moviesByGenre,
//                       );
//                     },
//                   ),
//               ],
//             ),
//           )
//         ],
//       ),
