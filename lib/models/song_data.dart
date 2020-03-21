import 'package:musiclibrary/models/feed.dart';
import 'package:json_annotation/json_annotation.dart';
part 'song_data.g.dart';

@JsonSerializable()
class SongData {
  Feed feed;

  SongData({this.feed});

  /// Converts Json string to Map Object
  factory SongData.fromJson(Map<String, dynamic> json) => _$SongDataFromJson(json);

  /// Converts Object to Json String
  Map<String, dynamic> toJson() => _$SongDataToJson(this);
}