import 'db_operations.dart';

class Note {
   int id;
   String title;
   String body;

  Note(this.id, this.title, this.body);

  Note.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    body = map['body'];
  }

  Map<String, dynamic> toMap(){
    return {
      DatabaseHelper.columnId : id,
      DatabaseHelper.columnTitle : title,
      DatabaseHelper.columnBody : body
    };
  }

  @override
  String toString(){
    return 'Note{title : $title, body : $body}';
  }
}





