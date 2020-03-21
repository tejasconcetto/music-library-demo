// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongData _$SongDataFromJson(Map<String, dynamic> json) {
  return SongData(
    feed: json['feed'] == null
        ? null
        : Feed.fromJson(json['feed'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SongDataToJson(SongData instance) => <String, dynamic>{
      'feed': instance.feed,
    };
