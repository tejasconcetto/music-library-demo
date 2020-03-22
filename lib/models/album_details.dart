import 'genre.dart';

import 'package:json_annotation/json_annotation.dart';

part 'album_details.g.dart';

@JsonSerializable()
class AlbumDetails {
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

  AlbumDetails(
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
  factory AlbumDetails.fromJson(Map<String, dynamic> json) => _$AlbumDetailsFromJson(json);

  /// Converts Object to Json String
  Map<String, dynamic> toJson() => _$AlbumDetailsToJson(this);
}
