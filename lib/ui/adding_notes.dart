import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/constants/buttons_and_icons_misc(classes).dart';

import 'main_screen.dart';

final bodyController = TextEditingController();
final headerController = TextEditingController();

class AddingNotes extends StatefulWidget {
  @override
  _AddingNotesState createState() => _AddingNotesState();
}

class _AddingNotesState extends State<AddingNotes> {

  @override
  void dispose() {
    //bodyController.dispose();
    //headerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backwardsCompatibility: true,
        leading: LeadingIcon(
          callBack: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white.withOpacity(0.4),
        actions: <Widget>[
          ActionsIconButton(
            icon: Icon(undo, color: black),
            callBack: () {
              debugPrint('undo tapped');
            },
          ),
          ActionsIconButton(
            icon: Icon(redo, color: black),
            callBack: () {
              debugPrint('redo tapped');
            },
          ),
          ActionsIconButton(
            icon: Icon(save, color: black),
            callBack: () {
              debugPrint(bodyController.text);
              debugPrint(headerController.text);
              getHeaderDataToMainScreen(context);
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

getHeaderDataToMainScreen(BuildContext context){
  Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => MainScreen(
          heading : headerController.text,
        )
      )
  );
}
