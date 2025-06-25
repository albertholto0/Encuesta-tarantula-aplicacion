class Question {
  const Question({required this.textQuestion, required this.answers});

  final String textQuestion;
  final List<String> answers;

  List<String> getOrderedAnswers() {
    return answers;
  }
}

final listQuestions = [
  Question(
    textQuestion:
        "¿Qué tanto consideras que se ha contaminado el ecosistema de tu comunidad en el último año?",
    answers: ["mucho", "poco", "nada"],
  ),
  Question(
    textQuestion:
        "¿Qué tanto consideras que se ha contaminado el ecosistema de tu comunidad en los últimos 5 años?",
    answers: ["mucho", "poco", "nada"],
  ),
  Question(
    textQuestion:
        "¿Qué tanto consideras que se ha contaminado el ecosistema de tu comunidad en los últimos 10 años?",
    answers: ["mucho", "poco", "nada"],
  ),
  Question(
    textQuestion:
        "¿Qué tanto consideras que se ha removido el bosque para implementar cultivos (maíz, agave), ganadería o construción de casas en los ultimos 5 años?",
    answers: ["mucho", "poco", "nada"],
  ),
  Question(
    textQuestion:
        "¿Qué tanto consideras que se ha removido el bosque para implementar cultivos (maíz, agave), ganadería o construción de casas en los ultimos 10 años?",
    answers: ["mucho", "poco", "nada"],
  ),
  Question(
    textQuestion: "¿Has visto a la tarántula de terciopelo negro?",
    answers: ["No", "No estoy seguro", "Si"],
  ),
  Question(
    textQuestion: "¿Dónde has visto a la tarántula?",
    answers: [
      "dentro o cerca de mi casa",
      "cultivos (maíz, agave), otro",
      "en el bosque (monte, cerro)",
    ],
  ),
];
