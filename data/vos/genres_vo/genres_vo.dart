import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/constant/hive_constant.dart';
part 'genres_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kGenresTypeID)
class GenresVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  GenresVO(this.id, this.name);

  factory GenresVO.fromJson(Map<String, dynamic> json) =>
      _$GenresVOFromJson(json);
}
