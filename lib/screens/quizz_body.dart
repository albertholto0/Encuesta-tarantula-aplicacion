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
  bool _showTextInput = false;
  final TextEditingController _textInputController = TextEditingController();

  void _answerQuestion(String answer) {
    if (answer == "Si (Especificar)") {
      setState(() {
        _showTextInput = true;
      });
      return;
    }

    _addAnswerAndProceed(answer);
  }

  void _confirmTextInput() {
    if (_textInputController.text.isEmpty) return;

    _addAnswerAndProceed(_textInputController.text);
    _textInputController.clear();
    setState(() {
      _showTextInput = false;
    });
  }

  void _addAnswerAndProceed(String answer) {
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

  void _goBack() {
    if (_showTextInput) {
      setState(() {
        _showTextInput = false;
        _textInputController.clear();
      });
    } else if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        _selectedAnswers.removeLast();
      });
    }
  }

  @override
  void dispose() {
    _textInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = listQuestions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _goBack,
        ),
        title: Text(
          'Pregunta ${_currentQuestionIndex + 1} de ${listQuestions.length}',
        ),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentQuestionIndex + 1) / listQuestions.length,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              currentQuestion.textQuestion,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          if (_showTextInput)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _textInputController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Por favor especifique',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _confirmTextInput,
                    child: const Text('Confirmar'),
                  ),
                ],
              ),
            )
          else
            ...currentQuestion.answers.map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: ElevatedButton(
                  onPressed: () => _answerQuestion(answer),
                  child: Text(answer),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }
}
