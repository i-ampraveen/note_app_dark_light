import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/constants/buttons_and_icons_misc(classes).dart';
import 'package:note_taking_app/constants/text_and_decorations(methods).dart';
import 'package:note_taking_app/db/model_notes.dart';
import 'package:note_taking_app/ui/adding_notes.dart';

import 'editing_notes.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Note> noteList = [];

  //String formattedDate = DateFormat.yMMMd('en_US').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    dbHelper.initDatabase();
    setNotesFromDB();
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
      appBar: mainScreenAppBar,
      floatingActionButton: FAB(
        whatToDo: () {
          gotoAddingNotesPage(context);
        },
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: noteList.length,
          itemBuilder: (context, index) {
            return TileCard(
              titleText: ('${noteList[index].title}'),
              dateText: ('${noteList[index].date}'),
              whatToDoOnPressed: (){
                openUserClickedNote();
                debugPrint('${noteList[index].id}');
              },
            );
          },
        ),
      ),
    );
  }

  gotoAddingNotesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddingNotes()),
    ).then((value) => setState(() {
          setNotesFromDB();
        }));
  }

  openUserClickedNote() async {
    int getIDOfTheUserClickedNote = int.parse('$noteList[index].id');
    var getNoteByID = await dbHelper.queryRows(getIDOfTheUserClickedNote);
    debugPrint('getIDOfTheUserClickedNote');
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => EditingNotes(getIDOfTheUserClickedNote)));
  }

}
