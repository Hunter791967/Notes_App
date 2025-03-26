class NoteModel {
  final int id;
  final String title;
  final String content;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    final attributes =
        json.containsKey('attributes') ? json['attributes'] : json;

    //print("🔍 Extracted attributes: $attributes"); // Debug extracted attributes

    return NoteModel(
      id: json['id'] ?? 0, // Default to 0 if id is missing
      title: attributes['title'] ?? 'No Title',
      content: attributes['content']?.toString() ?? '',
    );
  }
}
