import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/constants/text_and_decorations(methods).dart';
import 'package:note_taking_app/db/model_notes.dart';
import 'package:note_taking_app/ui/adding_notes.dart';


class MainScreen extends StatefulWidget {
  final heading;
  MainScreen({this.heading = 'default data'});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Note> noteList = [];

  @override
  void initState() {
    super.initState();
    dbHelper.initDatabase();
    setNotesFromDB();
  }

  setNotesFromDB() async{
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
        title: titleText,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white.withOpacity(0.4),
      ),
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              gotoAddingNotesPage(context);
            },
            child: const Icon(
              Icons.add,
            ),
            backgroundColor: Colors.green,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: noteList.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text('${noteList[index]}'),
          );
        },
      ),
    );
  }
  gotoAddingNotesPage(BuildContext context){
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => AddingNotes()),).then(
            (value) => setState(() {
              setNotesFromDB();
            }));
  }
}


