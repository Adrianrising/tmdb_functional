import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moviedb_functional/constant/hive_constant.dart';
import 'package:moviedb_functional/data/vos/get_actors_vo/get_actors_vo.dart';
import 'package:moviedb_functional/pages/home_page.dart';

import 'data/vos/get_now_playing_vo/get_now_playing_vo.dart';


void main() async{
  await Hive.initFlutter();

  Hive.registerAdapter(GetNowPlayingVOAdapter());
  Hive.registerAdapter(GetActorsVOAdapter());

  await Hive.openBox<GetNowPlayingVO>(kMoviesBoxName);
  await Hive.openBox<GetActorsVO>(kActorsBoxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
