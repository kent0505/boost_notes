final class Note {
  Note({
    this.id = 0,
    required this.title,
  });

  int id;
  String title;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
    );
  }

  static const table = 'Notes';
  static const create = '''
    CREATE TABLE IF NOT EXISTS $table (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT
    )
    ''';
}
