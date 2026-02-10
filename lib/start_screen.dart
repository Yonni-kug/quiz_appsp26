import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:  
        [
          Color.fromARGB(255, 78, 13, 151),
          Color.fromARGB(255, 107, 15, 91)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        ),
      ),
      child: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/assets/images/quiz-logo.png', width: 280,),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white),
              child: Text('Take the Quiz!'),
            ),
          Text('Challenge yourself!',
          style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          ],
        )
        ),
    );
  }
}