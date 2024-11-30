import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Map<int, String> userAnswers;

  ResultScreen({required this.questions, required this.userAnswers});

  // Calculate the score based on correct answers
  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i]['answer'] == userAnswers[i]) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    int score = calculateScore();

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Score container
              Container(
                width: 350,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Celebration Image
                    Image.asset(
                      'assets/images/celebrate.png',
                      height: 150,
                    ),
                    SizedBox(height: 20),
                    // Congratulatory Message
                    Text(
                      'Good Job!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Display Score
                    Text(
                      'Your Score: $score/${questions.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Button to navigate to CorrectAnswersScreen
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CorrectAnswersScreen(questions: questions),
                    ),
                  );
                },
                child: Text('See Correct Answers'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CorrectAnswersScreen extends StatelessWidget {
  final List<Map<String, Object>> questions;

  CorrectAnswersScreen({required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Correct Answers'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(questions[index]['question'] as String),
              subtitle: Text(
                'Correct Answer: ${(questions[index]['answer'] as String)}',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
