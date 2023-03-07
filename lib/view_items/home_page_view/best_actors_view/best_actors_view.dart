import 'package:flutter/material.dart';
import 'package:moviedb_functional/bloc/home_page_bloc.dart';
import 'package:moviedb_functional/easy_widget/easy_scroll_person_widget.dart';
import 'package:provider/provider.dart';

import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';

import '../../../data/vos/get_actors_vo/get_actors_vo.dart';

class BestActorsView extends StatelessWidget {
  const BestActorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<GetActorsVO>>(
      selector: (_, obj) => obj.gBestActors,
      shouldRebuild: (previous, next) => previous != next,
      builder: (context, actors, _) => EasyScrollPersonWidget(
        leftTitle: bestActorsText,
        rightTitle: moreActorsText,
        actors: actors,
        height: bestSectionHeight,
        color: Colors.black,
      ),
    );
  }
}
