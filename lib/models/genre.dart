import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genres {
  String genreId;
  String name;
  String url;

  Genres({this.genreId, this.name, this.url});

  /// Converts Json string to Map Object
  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  /// Converts Object to Json String
  Map<String, dynamic> toJson() => _$GenresToJson(this);
}
