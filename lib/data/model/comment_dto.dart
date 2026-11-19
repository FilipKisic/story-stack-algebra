import 'package:json_annotation/json_annotation.dart';
import 'package:story_stack/domain/entity/comment.dart';

part 'comment_dto.g.dart';

@JsonSerializable()
class CommentDto {
  final String by;
  final int id;
  final List<int>? kids;
  final int parent;
  final String text;
  final int time;

  CommentDto(
    this.by,
    this.id,
    this.kids,
    this.parent,
    this.text,
    this.time,
  );

  factory CommentDto.fromJson(Map<String, dynamic> json) => _$CommentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDtoToJson(this);

  Comment toDomain() {
    return Comment(
      this.by,
      this.id,
      null,
      this.parent,
      this.text,
      this.time,
    );
  }
}
