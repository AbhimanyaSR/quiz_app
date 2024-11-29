import 'dart:async';
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
  Timer? questionTimer; // Timer for each question
  double timeLeft = 5.0; // 5 seconds for each question

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    questionTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void startTimer() {
    // Reset the timer and start counting down
    timeLeft = 5.0;
    questionTimer?.cancel(); // Cancel any previous timer
    questionTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft -= 0.1; // Decrease time by 0.1 seconds
        } else {
          timer.cancel();
          nextQuestion(); // Automatically move to the next question
        }
      });
    });
  }

  void checkAnswer(int selectedOption) {
    if (!isAnswerSelected) {
      setState(() {
        isAnswerSelected = true;
        int correctAnswerIndex =
            widget.Questionlist[currentQuestionIndex]['answer'];

        if (selectedOption == correctAnswerIndex) {
          score++; // Increase score if correct
        }

        questionTimer?.cancel(); // Stop the timer when an answer is selected
      });
    }
  }

  void nextQuestion() {
    setState(() {
      isAnswerSelected = false;
      if (currentQuestionIndex < widget.Questionlist.length - 1) {
        currentQuestionIndex++;
        startTimer(); // Start the timer for the next question
      } else {
        showResult();
      }
    });
  }

  void showResult() {
    questionTimer?.cancel(); // Stop the timer when quiz ends
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
                Navigator.pop(context);
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
            LinearProgressIndicator(
              value: timeLeft / 5.0, // Fraction of time remaining
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            const SizedBox(height: 10),
            Text(
              'Time left: ${timeLeft.toStringAsFixed(1)} seconds',
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 20),
            for (int i = 0; i < options.length; i++)
              GestureDetector(
                onTap: () => checkAnswer(i),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  height: 60, // Set a fixed height for all boxes
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
                  child: Center(
                    child: Text(
                      options[i],
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
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
