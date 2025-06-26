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
    if (answer == "Sí (Especificar)") {
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
    const horizontalPadding = 20.0;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: _goBack),
        title: Text(
          'Pregunta ${_currentQuestionIndex + 1} de ${listQuestions.length}',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 35,
            ),
            height: 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(12),
              value: (_currentQuestionIndex + 1) / listQuestions.length,
              minHeight: 10,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(20),
                      child: Text(
                        currentQuestion.textQuestion,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    if (_showTextInput)
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: _textInputController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Por favor especifique',
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF4285F4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: _confirmTextInput,
                              child: const Text(
                                'Confirmar',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      ...currentQuestion.answers.map((answer) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () => _answerQuestion(answer),
                              child: Text(
                                answer,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
