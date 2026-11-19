import 'package:json_annotation/json_annotation.dart';
import 'package:story_stack/domain/entity/comment.dart';

part 'comment_dto.g.dart';

@JsonSerializable()
class CommentDto {
  final String? by;
  final int id;
  final List<int>? kids;
  final int parent;
  final String? text;
  final int time;
  final bool? deleted;
  final bool? dead;

  CommentDto(
    this.by,
    this.id,
    this.kids,
    this.parent,
    this.text,
    this.time,
    this.deleted,
    this.dead,
  );

  factory CommentDto.fromJson(Map<String, dynamic> json) => _$CommentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDtoToJson(this);

  // * by and text are explicitly not null because of the context where that function is called in repo
  // * In the repo, we get rid of the deleted comments, so we know that mapping will done on the correct object form
  Comment toDomain() {
    return Comment(
      this.by!,
      this.id,
      null,
      this.parent,
      this.text!,
      this.time,
    );
  }
}
