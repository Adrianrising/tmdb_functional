import '../../../data/vos/get_actors_vo/get_actors_vo.dart';

abstract class GetActorsDAO{
  void actorsToBox(List<GetActorsVO>actors);
  List<GetActorsVO>? actorsFromBox();

  Stream watchBox();
  Stream<List<GetActorsVO>?>actorsFromBoxAsStream();
}