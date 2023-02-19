import 'package:moviedb_functional/constant/strings.dart';

import '../constant/api_constant.dart';

extension ImageCompleteLink on String{
  String completeImage(){
    return (isEmpty)?defaultImg:'$kPrefixImageLink$this';
  }
}

extension PublishedYear on String{
  String takeOnlyYear(){
    return substring(0,4);
  }
}