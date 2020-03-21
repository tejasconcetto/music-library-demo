import 'package:musiclibrary/models/song_details.dart';

import 'author.dart';
import 'links.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed.g.dart';

@JsonSerializable()
class Feed {
  String title;
  String id;
  Author author;
  List<Links> links;
  String copyright;
  String country;
  String icon;
  String updated;
  List<SongDetails> results;

  Feed(
      {this.title,
      this.id,
      this.author,
      this.links,
      this.copyright,
      this.country,
      this.icon,
      this.updated,
      this.results});

  /// Converts Json string to Map Object
  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  /// Converts Object to Json String
  Map<String, dynamic> toJson() => _$FeedToJson(this);
}
