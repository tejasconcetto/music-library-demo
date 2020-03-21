// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genres _$GenresFromJson(Map<String, dynamic> json) {
  return Genres(
    genreId: json['genreId'] as String,
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
      'genreId': instance.genreId,
      'name': instance.name,
      'url': instance.url,
    };
