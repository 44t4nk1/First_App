import 'package:flutter/material.dart';

import './quiz.dart';

import './result.dart';

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

  void _resetQuiz(){
    setState(() {
    _questionIndex=0;
    _totalScore=0;
    });
  }

  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text':'Black','score':10},
        {'text':'Red','score':5}, 
        {'text':'Green','score':3}, 
        {'text':'White','score':1}
        ]
    },
    {
      'questionText': 'Whats\'s your favourite animal?',
      'answers': [
        {'text':'Rabbit','score':1}, 
        {'text':'Snake','score': 9},
        {'text':'Elephant','score':3}, 
        {'text':'Lion','score':7},
        ]
    },
    {
      'questionText': 'Who\'s your favourite Instructor?',
      'answers': [
        {'text':'Max','score':7}, 
        {'text':'Colt','score':2}, 
        {'text':'Steele','score':3}, 
        {'text':'China','score':10},
        ]
    },
  ];

  var _totalScore=0;

  void _answerQuestion(int score) {
    _totalScore=_totalScore + score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more!');
    }
  }

  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
              answerQuestion: _answerQuestion, 
              questionIndex: _questionIndex,
              questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
