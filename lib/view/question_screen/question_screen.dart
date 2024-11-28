import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  final List<Map> Questionlist;

  const QuestionsScreen({Key? key, required this.Questionlist})
      : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswerSelected = false;
  bool isAnswerCorrect = false;

  void checkAnswer(int selectedOption) {
    setState(() {
      isAnswerSelected = true;
      int correctAnswerIndex =
          widget.Questionlist[currentQuestionIndex]['answer'];

      if (selectedOption == correctAnswerIndex) {
        score++; // Increase score if correct
        isAnswerCorrect = true;
      } else {
        isAnswerCorrect = false;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      isAnswerSelected = false;
      if (currentQuestionIndex < widget.Questionlist.length - 1) {
        currentQuestionIndex++;
      } else {
        // Show the result if all questions are answered
        showResult();
      }
    });
  }

  void showResult() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Quiz Over!"),
          content: Text("Your Score: $score/${widget.Questionlist.length}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Go back to CategoryPage
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.Questionlist[currentQuestionIndex];
    final questionText = currentQuestion['question'];
    final options = currentQuestion['options'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${currentQuestionIndex + 1}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              questionText,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            for (int i = 0; i < options.length; i++)
              GestureDetector(
                onTap: () {
                  if (!isAnswerSelected) {
                    checkAnswer(i);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isAnswerSelected
                        ? (i ==
                                widget.Questionlist[currentQuestionIndex]
                                    ['answer']
                            ? Colors.green
                            : Colors.red)
                        : Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    options[i],
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            if (isAnswerSelected)
              ElevatedButton(
                onPressed: nextQuestion,
                child: const Text('Next Question'),
              ),
          ],
        ),
      ),
    );
  }
}
