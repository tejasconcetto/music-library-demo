import 'genre.dart';

import 'package:json_annotation/json_annotation.dart';

part 'song_details.g.dart';

@JsonSerializable()
class SongDetails {
  String artistName;
  String id;
  String releaseDate;
  String name;
  String kind;
  String copyright;
  String artistId;
  String artistUrl;
  String artworkUrl100;
  List<Genres> genres;
  String url;

  SongDetails(
      {this.artistName,
      this.id,
      this.releaseDate,
      this.name,
      this.kind,
      this.copyright,
      this.artistId,
      this.artistUrl,
      this.artworkUrl100,
      this.genres,
      this.url});

  /// Converts Json string to Map Object
  factory SongDetails.fromJson(Map<String, dynamic> json) => _$SongDetailsFromJson(json);

  /// Converts Object to Json String
  Map<String, dynamic> toJson() => _$SongDetailsToJson(this);
}
