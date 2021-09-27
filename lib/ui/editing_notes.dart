import 'package:flutter/cupertino.dart';
import 'package:note_taking_app/db/db_operations.dart';

final bodyController = TextEditingController();
final headerController = TextEditingController();
final dbHelperInEditingNote = DatabaseHelper.instance;

class EditingNotes extends StatefulWidget {

  final int getIDOfTheUserClickedNote;
  EditingNotes(this.getIDOfTheUserClickedNote);


  @override
  _EditingNotesState createState() => _EditingNotesState();
}

class _EditingNotesState extends State<EditingNotes> {

  @override
  void initState() {
    super.initState();
    //dbHelperInEditingNote.initDatabase();
    fetchNotesFromDB();
  }

  fetchNotesFromDB() async {
    print("Entered fetchNotes in note editing page");
    var queriedNotes = await dbHelperInEditingNote.queryRows(widget.getIDOfTheUserClickedNote);
    setState(() {
      //noteList = queriedNotes;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
