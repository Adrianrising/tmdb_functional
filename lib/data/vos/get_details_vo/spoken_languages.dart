import 'package:json_annotation/json_annotation.dart';
part 'spoken_languages.g.dart';
@JsonSerializable()
class SpokenLanguage{
  @JsonKey(name: 'english_name')
  String ? englishName;
  @JsonKey(name: 'iso_639_1')
  String ? iso6391;
  @JsonKey(name: 'name')
  String ? name;

  SpokenLanguage(this.englishName, this.iso6391, this.name);
  factory SpokenLanguage.fromJson(Map<String,dynamic>json)=>_$SpokenLanguageFromJson(json);
  Map<String,dynamic>toJson()=>_$SpokenLanguageToJson(this);
}
//"spoken_languages": [
// //         {
// //             "english_name": "English",
// //             "iso_639_1": "en",
// //             "name": "English"
// //         },
// //         {
// //             "english_name": "French",
// //             "iso_639_1": "fr",
// //             "name": "Français"
// //         },
// //         {
// //             "english_name": "Haitian; Haitian Creole",
// //             "iso_639_1": "ht",
// //             "name": ""
// //         },
// //         {
// //             "english_name": "Spanish",
// //             "iso_639_1": "es",
// //             "name": "Español"
// //         },
// //         {
// //             "english_name": "Xhosa",
// //             "iso_639_1": "xh",
// //             "name": ""
// //         }
// //     ],