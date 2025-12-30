final class Tag {
  Tag({
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

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map['id'],
      title: map['title'],
    );
  }

  static const table = 'Tags';
  static const create = '''
    CREATE TABLE IF NOT EXISTS $table (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT
    )
    ''';
}

final allNotes = Tag(title: 'All Notes');
