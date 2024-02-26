// ignore_for_file: avoid_print, use_key_in_widget_constructors, file_names, todo, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

final formKey = GlobalKey<FormState>();

// We must make the variable firstName nullable.
String? firstName;
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool enabled = false;
  int timesClicked = 0;
  String msg1 = '';
  String msg2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2 - User Input'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Enable Buttons'),
                  Switch(
                      value: enabled,
                      onChanged: (bool onChangedValue) {
                        print('onChangedValue is $onChangedValue');
                        enabled = onChangedValue;
                        setState(() {
                          if (enabled) {
                            timesClicked = 0;
                            msg1 = 'Click Me';
                            msg2 = 'Reset';
                          } else {
                            msg1 = 'Disabled';
                            msg2 = "Disabled";
                          }
                        });
                      }),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      timesClicked++;
                      msg1 = 'Clicked $timesClicked';
                      print('clicked $timesClicked');
                    });
                  },
                  child: Text(msg1),
                ),
              ),
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      timesClicked = 0;
                      msg1 = 'Click Me';
                    });
                  },
                  child: Text(msg2),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TODO: Build the text form field
                  // here as the first
                  // child of the column.
                  // Include as the second child
                  // of the column
                  // a submit button that will show a
                  // snackbar with the "firstName"
                  // if validation is satisfied.
                  TextFormField(
                    controller: textEditingController,
                    validator: (input) {
                      print('validator running');
                      return input!.length < 1 || input.length > 20
                          ? 'name must be a least on letter with a maximun of 20 letters'
                          : null;
                    },
                    onSaved: (input) {
                      firstName = input;
                    },
                    obscureText: true,
                    maxLength: 20,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.accessibility),
                      labelText: 'First Name',
                      helperText: 'min 1, max 20',
                      suffixIcon: Icon(
                        Icons.accessibility,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              textEditingController.clear();
                              SnackBar(
                                  content: Text(
                                      "Hey There your name is $firstName"));
                              setState(() {});
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
