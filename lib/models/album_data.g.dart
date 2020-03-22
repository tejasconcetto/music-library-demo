// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumData _$AlbumDataFromJson(Map<String, dynamic> json) {
  return AlbumData(
    feed: json['feed'] == null
        ? null
        : Feed.fromJson(json['feed'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AlbumDataToJson(AlbumData instance) => <String, dynamic>{
      'feed': instance.feed,
    };
