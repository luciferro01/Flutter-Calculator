// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Calculator_App(),
    );
  }
}

class Calculator_App extends StatefulWidget {
  const Calculator_App({Key? key}) : super(key: key);

  @override
  State<Calculator_App> createState() => _Calculator_AppState();
}

class _Calculator_AppState extends State<Calculator_App> {
  int? firstnum;
  int? secondnum;
  String textToDisplay = '';
  String operator = '';
  String res = '';
  void btnClicked(String buttonName) {
    if (buttonName == 'C') {
      textToDisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = '';
    } else if (buttonName == '+' ||
        buttonName == '-' ||
        buttonName == '*' ||
        buttonName == '/') {
      firstnum = int.parse(textToDisplay);
      res = '';
      operator = buttonName;
    } else if (buttonName == '=') {
      secondnum = int.parse(textToDisplay);
      if (operator == '+') {
        res = (firstnum! + secondnum!).toString();
      } else if (operator == '-') {
        res = (firstnum! - secondnum!).toString();
      } else if (operator == '*') {
        res = (firstnum! * secondnum!).toString();
      } else if (operator == '/') {
        res = (firstnum! ~/ secondnum!).toString();
      }
    } else {
      res = int.parse(textToDisplay + buttonName).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  Widget customButton(String buttonName) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => btnClicked(buttonName),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          elevation: 15,
        ),
        // style: ButtonStyle(
        // shape: CircleBorder(borderRadius: )
        // foregroundColor: MaterialStateProperty.,
        // backgroundColor: Material,
        // shape: MaterialStateProperty.all(
        //   RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(100.0),
        // side: BorderSide(
        //         color: Colors.teal,
        //         width: 2.0,
        // ),),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            buttonName,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(right: 50, bottom: 20),
              child: Text(
                textToDisplay,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                customButton('9'),
                customButton('8'),
                customButton('7'),
                customButton('+'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                customButton('6'),
                customButton('5'),
                customButton('4'),
                customButton('-'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                customButton('3'),
                customButton('2'),
                customButton('1'),
                customButton('*'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                customButton('C'),
                customButton('0'),
                customButton('='),
                customButton('/'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
