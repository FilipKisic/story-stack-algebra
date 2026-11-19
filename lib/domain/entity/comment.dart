class Comment {
  final String author;
  final int id;
  List<Comment>? replies;
  final int parent;
  final String text;
  final int time;

  Comment(
    this.author,
    this.id,
    this.replies,
    this.parent,
    this.text,
    this.time,
  );
}
