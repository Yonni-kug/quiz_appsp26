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
              const SizedBox(width: 20,),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: data['correct_answer'] == data['user_answer'] ? Color.fromARGB(255, 12, 29, 210) : Colors.red, width: 2),
                ),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: data['correct_answer'] == data['user_answer'] ? Color.fromARGB(255, 12, 29, 210) : Colors.red,
                  child: Text('#${(data['question_index'] as int)+1}', style: const TextStyle(color: Colors.white, fontSize: 12),),
                ),
              ),
              // Text('#${(data['question_index'] as int)+1}: ',textAlign: TextAlign.left, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: data['correct_answer'] == data['user_answer'] ? Color.fromARGB(255, 12, 29, 210) : Colors.red),),
              Expanded(
                child: Column(
                  children: [
                    Text(data['question'] as String, textAlign: TextAlign.left, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),),
                    const SizedBox(height: 1, width: 10,),
                    Text(data['user_answer'] as String, textAlign: TextAlign.center, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),),
                    Text(data['correct_answer'] as String,textAlign: TextAlign.center, style: const TextStyle(color: Color.fromARGB(255, 12, 29, 210), fontWeight: FontWeight.bold, fontSize: 12),),
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