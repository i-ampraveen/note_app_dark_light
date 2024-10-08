import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_taking_app/constants/classes.dart';
import 'package:note_taking_app/db/db_operations.dart';
import 'package:note_taking_app/utils/model_notes.dart';

final bodyController = TextEditingController();
final headerController = TextEditingController();
final dbHelper = DatabaseHelper.instance;
String formattedDate = DateFormat.yMMMd('en_US').format(DateTime.now());

class AddingNotes extends StatefulWidget {
  @override
  _AddingNotesState createState() => _AddingNotesState();
}

class _AddingNotesState extends State<AddingNotes> {
  @override
  void initState() {
    super.initState();
    bodyController.clear();
    headerController.clear();
  }

  @override
  void dispose() {
    bodyController.dispose();
    headerController.dispose();
    super.dispose();
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
          // ActionsIconButton(
          //   icon: Icon(undo, color: black),
          //   callBack: () {
          //     debugPrint('undo tapped');
          //   },
          // ),
          // ActionsIconButton(
          //   icon: Icon(redo, color: black),
          //   callBack: () {
          //     debugPrint('redo tapped');
          //   },
          // ),
          ActionsIconButton(
            icon: Icon(save, color: black),
            callBack: () async {
              String title = headerController.text;
              String body = bodyController.text;
              Note note = Note(20, title, body, formattedDate);

              var value = await dbHelper.insert(note);
              print(
                  "if 1 is return then insert success and 0 then not inserted : $value");

              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
        color: Colors.white.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              HeaderBody(
                textEditingController: headerController,
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
    );
  }
}
