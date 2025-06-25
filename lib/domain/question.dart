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
    answers: ["Mucho", "Poco", "Nada"],
  ),
  Question(
    textQuestion:
        "¿Qué tanto consideras que se ha contaminado el ecosistema de tu comunidad en los últimos 5 años?",
    answers: ["Mucho", "Poco", "Nada"],
  ),
  Question(
    textQuestion:
        "¿Qué tanto consideras que se ha contaminado el ecosistema de tu comunidad en los últimos 10 años?",
    answers: ["Mucho", "Poco", "Nada"],
  ),
  Question(
    textQuestion:
        "¿Qué tanto consideras que se ha removido el bosque para implementar cultivos (maíz, agave), ganadería o construcción de casas en el último año?",
    answers: ["Mucho", "Poco", "Nada"],
  ),
  Question(
    textQuestion:
        "¿Qué tanto consideras que se ha removido el bosque para implementar cultivos (maíz, agave), ganadería o construcción de casas en los últimos 5 años?",
    answers: ["Mucho", "Poco", "Nada"],
  ),
  Question(
    textQuestion:
        "¿Qué tanto consideras que se ha removido el bosque para implementar cultivos (maíz, agave), ganadería o construcción de casas en los últimos 10 años?",
    answers: ["Mucho", "Poco", "Nada"],
  ),
  Question(
    textQuestion: "¿Has visto a la tarántula de terciopelo negro?",
    answers: ["No", "No estoy seguro", "Sí"],
  ),
  Question(
    textQuestion: "¿Dónde la has visto?",
    answers: [
      "Dentro o cerca de mi casa",
      "Cultivos (maíz, agave, otro)",
      "En el bosque (monte, cerro)",
    ],
  ),
  Question(
    textQuestion: "¿Con qué frecuencia la has visto?",
    answers: ["Nunca", "Una vez al año", "Más de una vez al año"],
  ),
  Question(
    textQuestion:
        "¿Qué haces cuando te la encuentras en el campo, monte o bosque?",
    answers: [
      "La mato",
      "No hago nada",
      "La dejo donde la encontré o la llevo al cerro",
    ],
  ),
  Question(
    textQuestion: "¿Te afecta encontrarla en tus cultivos?",
    answers: [
      "Sí, ya no trabajo y me voy a casa",
      "Trabajo, pero no con normalidad",
      "No me afecta en nada",
    ],
  ),
  Question(
    textQuestion: "¿Qué haces (tú o tu familia) si la encuentras en tu casa?",
    answers: [
      "La mato",
      "No hago nada",
      "La dejo donde la encontré o la llevo al cerro",
    ],
  ),
  Question(
    textQuestion: "¿Conoces algún nombre en tu lengua materna para esta araña?",
    answers: ["No", "No estoy seguro", "Sí (Especificar)"],
  ),
  Question(
    textQuestion: "¿Te dan miedo las tarántulas?",
    answers: ["Mucho", "Más o menos", "Nada"],
  ),
  Question(
    textQuestion: "¿Crees que son venenosas para humanos?",
    answers: ["Sí", "No estoy seguro", "No"],
  ),
  Question(
    textQuestion: "¿Crees que son venenosas para mascotas o ganado?",
    answers: ["Sí", "No estoy seguro", "No"],
  ),
  Question(
    textQuestion: "¿Te ha picado, mordido o lastimado una tarántula?",
    answers: ["Sí", "No estoy seguro", "No"],
  ),
  Question(
    textQuestion: "¿Qué has hecho cuando te ha mordido o picado?",
    answers: [
      "Tomo algún remedio casero",
      "Nada, me recupero solo",
      "Voy al médico",
    ],
  ),
  Question(
    textQuestion:
        "¿Sabes si las tarántulas tienen uso medicinal en la comunidad?",
    answers: ["No", "No estoy seguro", "Sí (Especificar)"],
  ),
  Question(
    textQuestion:
        "¿Sabes si hay alguna representación de la tarántula en alguna artesanía, canción, vestimenta o vestigio arqueológico en la comunidad?",
    answers: ["No", "No estoy seguro", "Sí (Especificar)"],
  ),
  Question(
    textQuestion:
        "¿Conoces la existencia de proyectos acerca del cuidado y preservación de la tarántula?",
    answers: ["No", "Más o menos", "Sí"],
  ),
  Question(
    textQuestion:
        "¿Crees que conservando a la tarántula puedes generar ingresos económicos?",
    answers: ["No", "No estoy seguro", "Sí"],
  ),
  Question(
    textQuestion:
        "¿Estarías dispuesto a participar en algún proyecto de conservación de la tarántula, aunque NO haya remuneración económica o pago?",
    answers: ["No", "Tal vez", "Sí"],
  ),
  Question(
    textQuestion:
        "¿Estarías dispuesto a participar en algún proyecto de conservación de la tarántula CON remuneración económica o pago?",
    answers: ["No", "Tal vez", "Sí"],
  ),
  Question(
    textQuestion:
        "¿Consideras que el establecimiento de un proyecto de conservación de la tarántula ayudaría a la comunidad o empresa?",
    answers: ["No", "Tal vez", "Sí (Especificar)"],
  ),
  Question(
    textQuestion:
        "¿Sabías que algunas tarántulas se pueden comprar legalmente?",
    answers: ["No", "Tal vez", "Sí"],
  ),
  Question(
    textQuestion:
        "¿Sabías que hay personas que tienen tarántulas como mascotas?",
    answers: ["No", "Tal vez", "Sí"],
  ),
  Question(
    textQuestion: "¿Has visto tarántulas en tiendas de mascotas?",
    answers: ["No", "No estoy seguro", "Sí"],
  ),
  Question(
    textQuestion: "¿Dónde se ubica la tienda donde la has visto?",
    answers: ["En la ciudad", "En la comunidad", "En internet u otro lugar"],
  ),
  Question(
    textQuestion: "¿Conoces de alguien que venda tarántulas en la comunidad?",
    answers: ["No", "No estoy seguro", "Sí"],
  ),
  Question(
    textQuestion:
        "¿Sabes si alguien de tu comunidad extrae las tarántulas para venderlas en México u otros países?",
    answers: ["No", "No estoy seguro", "Sí"],
  ),
  Question(
    textQuestion:
        "¿Sabes si algún extranjero extrae las tarántulas para venderlas en México u otros países?",
    answers: ["No", "No estoy seguro", "Sí"],
  ),
  Question(
    textQuestion:
        "¿Apoyarías un reglamento comunitario (acuerdo de asamblea) para el cuidado y conservación de la tarántula?",
    answers: ["No", "Tal vez", "Sí"],
  ),
  Question(
    textQuestion: "¿Estarías dispuesto a conocer más sobre la tarántula?",
    answers: ["No", "Tal vez", "Sí"],
  ),
];
