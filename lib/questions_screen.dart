import 'package:flutter/material.dart';
import 'package:quiz_appsp26/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_appsp26/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

@override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
   var questionsIndex = 0;
  void answeredQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState((){
      questionsIndex++;
    });
  } 

  @override
  Widget build(BuildContext context) {
   
final currentQuestion = questions[questionsIndex];
return SizedBox(
  width: double.infinity,
  child: Container(
    margin: const EdgeInsets.all(25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text (currentQuestion.question,
        style: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox (height: 30,),
       ...currentQuestion.getShuffleAnswers().map((item){
        return AnswerButton(answerText: item,
        onTap: () {
          answeredQuestion(item);
        },);
       }),
      ],),
      ),
    );
  }
}
