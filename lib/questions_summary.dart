import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
const QuestionsSummary({super.key, required this.summaryData});
final List<Map<String, Object>> summaryData;
@override
  Widget build(BuildContext context){
    return Column(
      children: summaryData.map(
        (data){
          return Row(
            children: [
              Text(((data['question_index'] as int)+1).toString()),
              Expanded(
                child: Column(
                  children: [
                    Text(data['question'] as String),
                    const SizedBox(height: 5, ),
                    Text(data['user_answer'] as String, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),),
                    Text(data['correct_answer'] as String,style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16),),
                  ],
                ),
              )
            ],
          );
        }
      ).toList(),
    );
  }
}