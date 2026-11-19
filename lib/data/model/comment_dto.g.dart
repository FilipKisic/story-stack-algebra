// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) => CommentDto(
  json['by'] as String?,
  (json['id'] as num).toInt(),
  (json['kids'] as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
  (json['parent'] as num).toInt(),
  json['text'] as String?,
  (json['time'] as num).toInt(),
  json['deleted'] as bool?,
  json['dead'] as bool?,
);

Map<String, dynamic> _$CommentDtoToJson(CommentDto instance) =>
    <String, dynamic>{
      'by': instance.by,
      'id': instance.id,
      'kids': instance.kids,
      'parent': instance.parent,
      'text': instance.text,
      'time': instance.time,
      'deleted': instance.deleted,
      'dead': instance.dead,
    };
