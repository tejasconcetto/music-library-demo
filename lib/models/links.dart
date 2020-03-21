import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links {
  String self;
  String alternate;

  Links({this.self, this.alternate});

  /// Converts Json string to Map Object
  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  /// Converts Object to Json String
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
