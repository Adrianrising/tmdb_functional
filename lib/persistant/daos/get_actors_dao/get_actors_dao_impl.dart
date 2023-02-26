import 'package:hive/hive.dart';
import 'package:moviedb_functional/constant/hive_constant.dart';
import 'package:moviedb_functional/data/vos/get_actors_vo/get_actors_vo.dart';
import 'package:moviedb_functional/persistant/daos/get_actors_dao/get_actors_dao.dart';

class GetActorsDAOImpl extends GetActorsDAO{
  GetActorsDAOImpl._();
  static final GetActorsDAOImpl _singleton=GetActorsDAOImpl._();
  factory GetActorsDAOImpl()=>_singleton;
  Box<GetActorsVO>_getActorsBox()=>Hive.box<GetActorsVO>(kActorsBoxName);

  @override
  List<GetActorsVO>? actorsFromBox()=>_getActorsBox().values.toList();

  @override
  void actorsToBox(List<GetActorsVO> actors) {
    actors.forEach((element) {
      _getActorsBox().put(element.id, element);
    });
  }

  @override
  Stream watchBox()=>_getActorsBox().watch();

  @override
  Stream<List<GetActorsVO>?> actorsFromBoxAsStream()=>Stream.value(actorsFromBox());

}