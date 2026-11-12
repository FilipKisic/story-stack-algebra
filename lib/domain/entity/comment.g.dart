// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
  json['by'] as String,
  (json['id'] as num).toInt(),
  (json['kids'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
  (json['parent'] as num).toInt(),
  json['text'] as String,
  (json['time'] as num).toInt(),
);

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
  'by': instance.by,
  'id': instance.id,
  'kids': instance.kids,
  'parent': instance.parent,
  'text': instance.text,
  'time': instance.time,
};
