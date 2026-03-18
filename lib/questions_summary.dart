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
            mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('#${(data['question_index'] as int)+1}: ',textAlign: TextAlign.left, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
              Expanded(
                child: Column(
                  children: [
                    Text(data['question'] as String, textAlign: TextAlign.left, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),),
                    const SizedBox(height: 3, width: double.infinity,),
                    Text(data['user_answer'] as String, textAlign: TextAlign.left, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14),),
                    Text(data['correct_answer'] as String,textAlign: TextAlign.left, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),),
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