import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/constants/buttons_and_icons_misc(classes).dart';
import 'package:note_taking_app/db/db_operations.dart';
import 'package:note_taking_app/db/model_notes.dart';

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
    dbHelperInEditingNote.initDatabase();
    fetchNotesFromDB();
  }

  // Future<List<Note>> fetchedNotes() async {
  //   dbHelperInEditingNote.initDatabase();
  //   final List <Map<String, dynamic>> queriedNotes = await dbHelperInEditingNote.queryRows(widget.getIDOfTheUserClickedNote);
  //
  //   return List.generate(Map.length, (i){
  //     return Note(
  //       title: Map[i]['title'],
  //       body: Map[i]['body'],
  //     );
  //   });
  // }

  fetchNotesFromDB() async {
    print("Entered fetchNotes in note editing page");
    var queriedNotes = await dbHelperInEditingNote.fetchNotesFromID(widget.getIDOfTheUserClickedNote);
    print(queriedNotes);
    print(queriedNotes[0].title);
    print(queriedNotes[0].body);
    // setState(() {
    //
    // });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.white.withOpacity(0.4),
        // child: Padding(
        //   padding: const EdgeInsets.all(13.0),
        //   child: Column(
        //     children: [
        //       HeaderBody(
        //         textEditingController: headerController,
        //       ),
        //       SizedBox(
        //         height: 32.0,
        //       ),
        //       Expanded(
        //         child: NotesBody(
        //           textEditingController: bodyController,
        //         ),
        //       ),
        //     ],
        //   ),
        // )
    );
  }
}
