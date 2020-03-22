import 'package:musiclibrary/models/feed.dart';
import 'package:json_annotation/json_annotation.dart';
part 'album_data.g.dart';

@JsonSerializable()
class AlbumData {
  Feed feed;

  AlbumData({this.feed});

  /// Converts Json string to Map Object
  factory AlbumData.fromJson(Map<String, dynamic> json) => _$AlbumDataFromJson(json);

  /// Converts Object to Json String
  Map<String, dynamic> toJson() => _$AlbumDataToJson(this);
}