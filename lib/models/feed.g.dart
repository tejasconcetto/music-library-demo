// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return Feed(
    title: json['title'] as String,
    id: json['id'] as String,
    author: json['author'] == null
        ? null
        : Author.fromJson(json['author'] as Map<String, dynamic>),
    links: (json['links'] as List)
        ?.map(
            (e) => e == null ? null : Links.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    copyright: json['copyright'] as String,
    country: json['country'] as String,
    icon: json['icon'] as String,
    updated: json['updated'] as String,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : AlbumDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'author': instance.author,
      'links': instance.links,
      'copyright': instance.copyright,
      'country': instance.country,
      'icon': instance.icon,
      'updated': instance.updated,
      'results': instance.results,
    };
