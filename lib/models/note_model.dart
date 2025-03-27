class NoteModel {
  // final int id;
  final String title;
  final String content;
  final String date;
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
