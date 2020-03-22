// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDetails _$AlbumDetailsFromJson(Map<String, dynamic> json) {
  return AlbumDetails(
    artistName: json['artistName'] as String,
    id: json['id'] as String,
    releaseDate: json['releaseDate'] as String,
    name: json['name'] as String,
    kind: json['kind'] as String,
    copyright: json['copyright'] as String,
    artistId: json['artistId'] as String,
    artistUrl: json['artistUrl'] as String,
    artworkUrl: json['artworkUrl100'] as String,
    genres: (json['genres'] as List)
        ?.map((e) =>
            e == null ? null : Genres.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$AlbumDetailsToJson(AlbumDetails instance) =>
    <String, dynamic>{
      'artistName': instance.artistName,
      'id': instance.id,
      'releaseDate': instance.releaseDate,
      'name': instance.name,
      'kind': instance.kind,
      'copyright': instance.copyright,
      'artistId': instance.artistId,
      'artistUrl': instance.artistUrl,
      'artworkUrl100': instance.artworkUrl,
      'genres': instance.genres,
      'url': instance.url,
    };
