import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp()); //Funcion principal

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    // Variable con las preguntas y respuestas
    {
      'questionText': 'Q1. Todos sabemos que te estaría entrando...?',
      'answers': [
        {'text': 'Mas plata', 'score': -2},
        {'text': 'Una llamada', 'score': -2},
        {'text': 'Agua', 'score': 10},
        {'text': 'Un jean viejo', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Tu jermu está re amorosa y no rompe las bolas?',
      'answers': [
        {'text': 'Habrá cambiado el caracter', 'score': -2},
        {'text': 'Se dió cuenta que me molesta', 'score': -2},
        {'text': 'Le hizo caso a tu mamá', 'score': -2},
        {'text': 'Te esta gorreando, clavadísimo', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3. La bruja empezó a ir al gim, y dice que el profe es re macanudo',
      'answers': [
        {'text': 'Profe copado, pasa nada', 'score': -2},
        {'text': 'Chiquiplish Chiquiplish', 'score': 10},
        {'text': 'Menos mal que hace algo', 'score': -2},
        {'text': 'Debe ser gay el profe', 'score': -2},
      ],
    },
  ];

  var _questionIndex = 0; // Variable auxiliar para el puntaje
  var _totalScore = 0; // Variable auxiliar para el puntaje

  void _resetQuiz() {
    // Funcion para reiniciar el quiz
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // Suma el puntaje de la respueta al puntaje general
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('Una más!');
    } else {
      print('No mas preguntas Sr Juez!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            //Barra superior
            title: Center(child: Text('Quiz APP')), // Titulo de la app
            backgroundColor: Colors.blueAccent),
        body: Padding(
          padding: const EdgeInsets.all(30.0), // Espacio despues de la barra superior
          child: _questionIndex < _questions.length // Si numero pregunta es menor cantidad preguntas
              ? Quiz(
                  // Pintado de las preguntas
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
