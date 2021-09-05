import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/constants/text_and_decorations(methods).dart';

const undo = Icons.undo_rounded;
const redo = Icons.redo_rounded;
const save = Icons.check_rounded;

const black = Colors.black;

class LeadingIcon extends StatelessWidget {
  final Function callBack;

  const LeadingIcon({@required this.callBack});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
      onPressed: callBack,
    );
  }
}

class ActionsIconButton extends StatelessWidget {
  final Icon icon;
  final Function callBack;

  const ActionsIconButton({@required this.icon, @required this.callBack});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: callBack,
    );
  }
}

class NotesBody extends StatelessWidget {
  final TextEditingController textEditingController;

  const NotesBody({this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: bTextStyle,
      maxLines: 1000,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
      cursorColor: Colors.black,
      decoration:
          InputDecoration.collapsed(hintText: 'Enter your notes here..'),
    );
  }
}

class HeaderBody extends StatelessWidget {
  final TextEditingController textEditingController;

  const HeaderBody({this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: hEditPageTextStyle,
      maxLines: 1,
      cursorColor: Colors.black,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration.collapsed(hintText: 'Input Title'),
    );
  }
}
