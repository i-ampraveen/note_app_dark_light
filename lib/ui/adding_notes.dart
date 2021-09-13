import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_taking_app/constants/buttons_and_icons_misc(classes).dart';
import 'package:note_taking_app/db/db_operations.dart';
import 'package:note_taking_app/db/model_notes.dart';


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
            callBack: () async {
              String title = headerController.text;
              String body = bodyController.text;
              Note note = Note(20, title, body, formattedDate);

              var value = await dbHelper.insert(note);
              print("if 1 is return then insert success and 0 then not inserted : $value");

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

//onPressed: calculateWhetherDisabledReturnsBool() ? null : () => whatToDoOnPressed,


// Use a StatefulWidget/State and create a variable to hold your condition (e.g. isButtonDisabled)
// Set this to true initially (if that's what you desire)
// When rendering the button, don't directly set the onPressed value to either null or some function onPressed: () {}
// Instead, conditionally set it using a ternary or a helper function (example below)
// Check the isButtonDisabled as part of this conditional and return either null or some function.
// When the button is pressed (or whenever you want to disable the button) use setState(() => isButtonDisabled = true) to flip the conditional variable.
// Flutter will call the build() method again with the new state and the button will be rendered with a null press handler and be disabled.

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   bool _isButtonDisabled;
//
//   @override
//   void initState() {
//     _isButtonDisabled = false;
//   }
//
//   void _incrementCounter() {
//     setState(() {
//       _isButtonDisabled = true;
//       _counter++;
//     });
//   }

// new Text(
// '$_counter',
// style: Theme.of(context).textTheme.display1,
// ),
// _buildCounterButton(),
// ],
// ),
// ),
// );
// }
//
// Widget _buildCounterButton() {
//   return new RaisedButton(
//     child: new Text(
//         _isButtonDisabled ? "Hold on..." : "Increment"
//     ),
//     onPressed: _isButtonDisabled ? null : _incrementCounter,
//   );
// }
// }

// Widget _buildCounterButton() {
//   return new RaisedButton(
//     child: new Text(
//         _isButtonDisabled ? "Hold on..." : "Increment"
//     ),
//     onPressed: _counterButtonPress(),
//   );
// }
//
// Function _counterButtonPress() {
//   if (_isButtonDisabled) {
//     return null;
//   } else {
//     return () {
//       // do anything else you may want to here
//       _incrementCounter();
//     };
//   }
// }