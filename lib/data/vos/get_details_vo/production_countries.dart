import 'package:json_annotation/json_annotation.dart';
part 'production_countries.g.dart';
@JsonSerializable()
class ProductionCountries{
  @JsonKey(name: 'iso_3166_1')
  String ? iso31661;
  @JsonKey(name: 'name')
  String ? name;

  ProductionCountries(this.iso31661, this.name);
  factory ProductionCountries.fromJson(Map<String,dynamic>json)=>_$ProductionCountriesFromJson(json);
  Map<String,dynamic>toJson()=>_$ProductionCountriesToJson(this);
}
////     "production_countries": [
// //         {
// //             "iso_3166_1": "US",
// //             "name": "United States of America"
// //         }
// //     ],