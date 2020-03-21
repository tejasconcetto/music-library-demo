import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
class Author {
  String name;
  String uri;

  Author({this.name, this.uri});

  /// Converts Json string to Map Object
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  /// Converts Object to Json String
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
