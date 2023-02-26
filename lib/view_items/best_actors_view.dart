import 'package:flutter/material.dart';
import 'package:moviedb_functional/easy_widget/easy_scroll_person_widget.dart';

import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/apply/tmdb_apply.dart';
import '../data/apply/tmdb_apply_impl.dart';
import '../data/vos/get_actors_vo/get_actors_vo.dart';

class BestActorsView extends StatefulWidget {
  const BestActorsView({Key? key}) : super(key: key);

  @override
  State<BestActorsView> createState() => _BestActorsViewState();
}

class _BestActorsViewState extends State<BestActorsView> {
  final TmdbApply tmdDbApply = TmdbApplyImpl();
  int page = 1;
  List<GetActorsVO> actors = [];

  @override
  void initState() {
    // tmdDbApply.getActors(page).then((value) {
    //   setState(() {
    //     actors = value ?? [];
    //   });
    // });
    tmdDbApply.getActorsFromBoxAsStream(page).listen((event) {
      if(mounted){
        setState(() {
          actors=event??[];
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasyScrollPersonWidget(
        leftTitle: bestActorsText,
        rightTitle: moreActorsText,
        actors: actors,
        height: bestSectionHeight,
    color: Colors.black,);
  }
}
