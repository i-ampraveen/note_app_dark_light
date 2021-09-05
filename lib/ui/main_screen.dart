import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/constants/text_and_decorations(methods).dart';
import 'package:note_taking_app/ui/adding_notes.dart';

class MainScreen extends StatefulWidget {
  final heading;
  MainScreen({this.heading = 'default data'});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: titleText,
        backwardsCompatibility: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white.withOpacity(0.4),
      ),
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddingNotes()));
            },
            child: const Icon(
              Icons.add,
            ),
            backgroundColor: Colors.green,
          ),
        ),
      ),
      body: Container(
        color: Colors.white.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 0, 0),
          child: Column(
            children: [
              Text(
                widget.heading,
              style: hListTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
