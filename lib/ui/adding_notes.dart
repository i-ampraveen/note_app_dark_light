import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/constants/buttons_and_icons_misc(classes).dart';

class AddingNotes extends StatefulWidget {
  @override
  _AddingNotesState createState() => _AddingNotesState();
}

class _AddingNotesState extends State<AddingNotes> {
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
            callBack: (){
              debugPrint('undo tapped');
          },),
          ActionsIconButton(
            icon: Icon(redo, color: black),
            callBack: (){
              debugPrint('redo tapped');
            },
          ),
          ActionsIconButton(
            icon: Icon(save, color: black),
            callBack: (){
              debugPrint('save tapped');
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
              HeaderBody(),
              SizedBox(height: 32.0,),
              Expanded(
                  child: NotesBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
