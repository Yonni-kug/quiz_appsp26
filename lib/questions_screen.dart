import 'package:flutter/material.dart';
import 'package:quiz_appsp26/answer_button.dart';
import 'package:quiz_appsp26/questions_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  get style => null;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
return SizedBox(
  width: double.infinity,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text (currentQuestion.question,
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        )
      ),
      const SizedBox (height: 30,),
      AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
      AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
      AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
      AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}),
    ]),
    );
  }
}
