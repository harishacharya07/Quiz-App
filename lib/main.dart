import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  final question = const[
    {
      'questionText': 'whats your favorite colour',
      'answer': ['Red', 'Black', 'Green', 'Yellow'],
    },
    {
      'questionText': 'whats your favorite animal',
      'answer': ['Dog', 'Bear', 'Lion', 'Rabbit'],
    },
    {
      'questionText': 'whats your favorite food',
      'answer': ['Mahala', 'Chicken', 'fish', 'Yark'],
    },
    {
      'questionText': 'whats your favorite car',
      'answer': ['Bmw', 'Bugatti', 'Rolls Royce', 'Meme'],
    },
  ];

  void _answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print('you chosen the  answer');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
          backgroundColor: Colors.red,
        ),
        body: questionIndex < question.length
            ? Column(
                children: <Widget>[
                  Question(
                    question[questionIndex]['questionText'],
                  ),
                  ...(question[questionIndex]['answer'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it'),
              ),
      ),
    );
  }
}
