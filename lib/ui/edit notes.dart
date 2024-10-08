import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_taking_app/constants/classes.dart';
import 'package:note_taking_app/constants/methods.dart';
import 'package:note_taking_app/db/db_operations.dart';
import 'package:note_taking_app/utils/model_notes.dart';

import 'add notes.dart';

final dbHelperInEditingNote = DatabaseHelper.instance;
late TextEditingController titleController;
late TextEditingController bodyController;
String formattedDate = DateFormat.yMMMd('en_US').format(DateTime.now());
late Note currentNote;

removeNotesFromDB(int id) async {
  print("Removing notes in main page");
  await dbHelper.delete(id);
  //setNotesFromDB();
}

class EditingNotes extends StatefulWidget {
  final int getIDOfTheUserClickedNote;

  EditingNotes(this.getIDOfTheUserClickedNote);

  @override
  _EditingNotesState createState() => _EditingNotesState();
}

class _EditingNotesState extends State<EditingNotes> {
  List<Note> fetchedNotes = [];
  List<Note> noteList = [];

  @override
  void initState() {
    super.initState();
    dbHelperInEditingNote.initDatabase();
    fetchNotesFromDB();
  }

  fetchNotesFromDB() async {
    print("Entered fetchNotes in note editing page");
    var queriedNotes = await dbHelperInEditingNote
        .fetchNotesFromID(widget.getIDOfTheUserClickedNote);
    titleController = TextEditingController(text: queriedNotes[0].title);
    bodyController = TextEditingController(text: queriedNotes[0].body);
    setState(() {
      fetchedNotes = queriedNotes;
    });
  }

  setNotesFromDB() async {
    print("Entered setNotes in main page");
    var fetchedNotes = await dbHelper.getNotesFromDB();
    setState(() {
      noteList = fetchedNotes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: LeadingIcon(
          callBack: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white.withOpacity(0.4),
        actions: <Widget>[
          ActionsIconButton(
            icon: Icon(save, color: black),
            callBack: () async {
              String title = titleController.text;
              String body = bodyController.text;
              Note note = Note(
                  widget.getIDOfTheUserClickedNote, title, body, formattedDate);

              var value = await dbHelperInEditingNote.update(note);
              print(
                  "if 1 is return then edited success and 0 then not edited : $value");

              Navigator.pop(context);
            },
          ),
          ActionsIconButton(
            icon: Icon(delete, color: black),
            callBack: () {
              int id = (fetchedNotes[0].id);
              handleDelete(context, id);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white.withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                HeaderBody(
                  textEditingController: titleController,
                ),
                SizedBox(
                  height: 32.0,
                ),
                Expanded(
                  child: NotesBody(
                    textEditingController: bodyController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
