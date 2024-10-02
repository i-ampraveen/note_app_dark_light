import '../db/db_operations.dart';

class Note {
  late int id;
  late String title;
  late String body;
  late String date;

  Note(this.id, this.title, this.body, this.date);

  Note.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    body = map['body'];
    date = map['date'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnTitle: title,
      DatabaseHelper.columnBody: body,
      DatabaseHelper.columnDate: date,
    };
  }

  @override
  String toString() {
    return '$title, $date';
  }
}
