import 'package:flutter/material.dart';
import 'package:cuestionario_tarantula/domain/question.dart';
import 'package:cuestionario_tarantula/domain/form.dart';
import 'package:cuestionario_tarantula/screens/final_screen.dart';

class QuizzBodyScreen extends StatefulWidget {
  final Formulario formulario;

  const QuizzBodyScreen({super.key, required this.formulario});

  @override
  State<QuizzBodyScreen> createState() => _QuizzBodyScreenState();
}

class _QuizzBodyScreenState extends State<QuizzBodyScreen> {
  int _currentQuestionIndex = 0;
  final List<String> _selectedAnswers = [];

  void _answerQuestion(String answer) {
    setState(() {
      _selectedAnswers.add(answer);
    });

    if (_currentQuestionIndex == listQuestions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => FinalScreen(
            formulario: widget.formulario,
            respuestas: _selectedAnswers,
          ),
        ),
      );
    } else {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = listQuestions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // No mostrar el botón de retroceso
        title: Text(
          'Pregunta ${_currentQuestionIndex + 1} de ${listQuestions.length}',
        ),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentQuestionIndex + 1) / listQuestions.length,
          ),
          Text(currentQuestion.textQuestion),
          ...currentQuestion.answers.map((answer) {
            return ElevatedButton(
              onPressed: () => _answerQuestion(answer),
              child: Text(answer),
            );
          }),
        ],
      ),
    );
  }
}
