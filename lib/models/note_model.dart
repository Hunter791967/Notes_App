import 'package:hive/hive.dart';

part 'note_model.g.dart'; //This file must be the same as model file name.
@HiveType(typeId: 0)

class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  NoteModel({
    required this.date,
    required this.color,
    required this.title,
    required this.content,
  });

  // Override the toString() method to provide a better string representation
  @override
  String toString() {
    return 'NoteModel(title: $title, content: $content, date: $date, color: $color)';
  }

}
