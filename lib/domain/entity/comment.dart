import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final String by;
  final int id;
  final List<int> kids;
  final int parent;
  final String text;
  final int time;

  Comment(
    this.by,
    this.id,
    this.kids,
    this.parent,
    this.text,
    this.time,
  );

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
