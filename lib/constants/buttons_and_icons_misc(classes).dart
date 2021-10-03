import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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

  const NotesBody({@required this.textEditingController});

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

  const HeaderBody({@required this.textEditingController});

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

class TileCard extends StatelessWidget {
  final String titleText;
  final String dateText;
  final Function whatToDoOnPressed;

  const TileCard({@required this.titleText, @required this.dateText, @required this.whatToDoOnPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 0,
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: whatToDoOnPressed,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          title: Text(
            titleText,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          tileColor: Colors.grey.withOpacity(0.2),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(dateText),
          ),
        ),
      ),
    );
  }
}

class FAB extends StatelessWidget {

  final Function whatToDo;

  const FAB({@required this.whatToDo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 80.0,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: whatToDo,
          child: const Icon(
            Icons.add,
          ),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}

class Delete extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.9),
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.delete,
          color: Colors.black,
        ),
      ),
    );
  }
}




