import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Map<int, String> userAnswers;

  ResultScreen({required this.questions, required this.userAnswers});

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 350,
                height: 750,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 165, 205, 237).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 20,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/celebrate.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Good Job!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Your Score: $score/${questions.length}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 40),
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
