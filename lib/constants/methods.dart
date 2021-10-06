import 'package:flutter/material.dart';
import 'package:note_taking_app/db/db_operations.dart';

Text titleText = Text(
  'Notes',
  style: hMainTextStyle,
);

TextStyle hMainTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
  color: Colors.black,
);

TextStyle bTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.black,
);

TextStyle hListTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 20.0,
  color: Colors.black,
);

TextStyle hEditPageTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
  color: Colors.black,
);

AppBar mainScreenAppBar = AppBar(
  elevation: 0,
  title: titleText,
  automaticallyImplyLeading: false,
  backgroundColor: Colors.white.withOpacity(0.4),
);

final dbHelperInMethodClass = DatabaseHelper.instance;

void handleDelete(BuildContext context, int id) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('Delete Note'),
          content: Text('This note will be deleted permanently'),
          actions: <Widget>[
            TextButton(
              child: Text('DELETE',
                  style: TextStyle(
                      color: Colors.red.shade300,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1)),
              onPressed: () async {
                await dbHelperInMethodClass.delete(id);
                debugPrint('Note deleted');
                Navigator.popUntil(
                    context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
            TextButton(
              child: Text('CANCEL',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1)),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}
