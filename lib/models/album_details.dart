import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';

part 'album_details.g.dart';

///
/// this class contains album details
///
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
  String artworkUrl;
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
      this.artworkUrl,
      this.genres,
      this.url});

  /// Converts Json string to Map Object
  factory AlbumDetails.fromJson(Map<String, dynamic> json) =>
      _$AlbumDetailsFromJson(json);

  /// Converts Object to Json String
  Map<String, dynamic> toJson() => _$AlbumDetailsToJson(this);
}
