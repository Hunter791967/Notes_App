import 'package:hive/hive.dart';

part 'note_model.g.dart';
@HiveType(typeId: 0)

class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  NoteModel({
    required this.date,
    required this.color,
    required this.title,
    required this.content,
  });

  // factory NoteModel.fromJson(Map<String, dynamic> json) {
  //   final attributes =
  //       json.containsKey('attributes') ? json['attributes'] : json;
  //
  //   //print("🔍 Extracted attributes: $attributes"); // Debug extracted attributes
  //
  //   return NoteModel(
  //     //id: json['id'] ?? 0, // Default to 0 if id is missing
  //     title: attributes['title'] ?? 'No Title',
  //     content: attributes['content'] ?? '',
  //     date: attributes['date'],
  //     color: color,
  //   );
  // }
}
