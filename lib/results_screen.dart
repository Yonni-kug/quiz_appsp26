
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_appsp26/data/questions.dart';
import 'package:quiz_appsp26/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key,
   required this.chosenAnswers,
   required this.switchScreen});
   

  final List<String> chosenAnswers;
  final void Function() switchScreen;

  List<Map<String, Object>> getSummaryData(){
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],

      });
    }
    return summary;
    
  }


  void setScreen() {
    chosenAnswers.clear();
    switchScreen();
  }

  @override
  Widget build(context)
  {
    final summaryData = getSummaryData();
    final numTotalQuestions = getSummaryData().length;
    final numTotalCorrect = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text('You answered $numTotalCorrect out of $numTotalQuestions Correctly',textAlign: TextAlign.center, style:GoogleFonts.lato( color: Colors.white, fontSize: 25, ),),
            const SizedBox(height:30,),
            QuestionsSummary(summaryData: summaryData),
            const Text('Try again?', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,)),
            const SizedBox(height:30,),
            TextButton(
              onPressed: (){
                setScreen();
              },
               style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 12, 29, 210),
              ),
              child: const Text('Restart Quiz?', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold,)),
            )
          ],
        ),
      ),
    );
  }
}