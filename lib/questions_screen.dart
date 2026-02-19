import 'package:flutter/material.dart';
import 'package:quiz_appsp26/answer_button.dart';
import 'package:quiz_appsp26/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  get style => null;
   var questionsIndex = 0;
  void answeredQuestion(){
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
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox (height: 30,),
       ...currentQuestion.getShuffleAnswers().map((item){
        return AnswerButton(answerText: item,
        onTap: () {},);
       }),
      ],),
      ),
    );
  }
}
