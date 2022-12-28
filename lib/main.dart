// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:complete_flutter_guide/answer.dart';
import 'package:complete_flutter_guide/question.dart';
import 'package:complete_flutter_guide/quiz.dart';
import 'package:complete_flutter_guide/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = const [
    {
      'questionText': 'What\' your favorite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'blue', 'score': 5},
        {'text': 'yellow', 'score': 4},
        {'text': 'orange', 'score': 1},
      ],
    },
    {
      'questionText': 'What\' your favorite animal?',
      'answers': [
        {'text': 'rabbit', 'score': 3},
        {'text': 'snake', 'score': 11},
        {'text': 'elephant', 'score': 5},
        {'text': 'lion', 'score': 9},
      ],
    },
    {
      'questionText': 'What\' your favorite teacher?',
      'answers': [
        {'text': 'musa ', 'score': 1},
        {'text': 'hamza', 'score': 1},
        {'text': 'bilal', 'score': 1},
        {'text': 'sadiq', 'score': 1},
      ],
    },
  ];
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    // print('Answer chosen');

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQizz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // const question = [];  this did not work if a question is a comstant
    // context holds meta data about your MyApp its position and the widgets tree
    // of overall application
    //set state is a function that forces flutter to re-render the user interface
    //how ever not the entire interface its call build again
    //name argument ={}
    //positional argument no curly braces
    //final is runtime constant value
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('MyApp'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                resultScore: _totalScore,
                resetHandler: _resetQizz,
              ),
      ),
    );
  }
}
