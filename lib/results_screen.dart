import 'package:flutter/material.dart';
import 'package:quiz_appsp26/data/questions.dart';
import 'package:quiz_appsp26/questions_summary.dart';
class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key,
   required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData(){
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct answer': questions[i].answers[0],
        'user answer': chosenAnswers[i]

      });
    }
    return summary;
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
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text('You answered $numTotalCorrect out of $numTotalQuestions Correctly', style: const TextStyle(color: Colors.white)),
            const SizedBox(height:30,),
            QuestionsSummary(summaryData: summaryData),
            const Text('List of Answers and Questions'),
            const SizedBox(height:30,),
            TextButton(
              onPressed: (){},
              child: const Text('Restart Quiz', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}