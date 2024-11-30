import 'package:flutter/material.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Tokyo', 'London', 'Paris', 'Berlin'],
      'answer': 'Paris',
    },
    {
      'question': 'What is 2 + 2?',
      'options': ['3', '4', '5', '6'],
      'answer': '4',
    },
    {
      'question': 'Which of the following is the largest Ocean?',
      'options': ['Indian Ocean', 'Atlantic Ocean', 'Pacific Ocean', 'None'],
      'answer': 'Pacific Ocean',
    },
    {
      'question':
          'Which of the following is known as both Country and Continent?',
      'options': ['Africa', 'Europe', 'South America', 'Australia'],
      'answer': 'Australia',
    },
    {
      'question': 'Which one is the largest Continent in our planet?',
      'options': ['Africa', 'Asia', 'North America', 'Antarctica'],
      'answer': 'Asia',
    }
  ];

  final Map<int, String> _userAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ..._questions.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, Object> question = entry.value;
              return Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${index + 1}. ${question['question']}',
                          style: TextStyle(fontSize: 18)),
                      ...List.generate((question['options'] as List).length,
                          (i) {
                        String option = (question['options'] as List)[i];
                        return RadioListTile(
                          title: Text(option),
                          value: option,
                          groupValue: _userAnswers[index],
                          onChanged: (value) {
                            setState(() {
                              _userAnswers[index] = value!;
                            });
                          },
                        );
                      }),
                    ],
                  ),
                ),
              );
            }).toList(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      questions: _questions,
                      userAnswers: _userAnswers,
                    ),
                  ),
                );
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
