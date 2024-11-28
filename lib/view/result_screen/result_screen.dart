import 'package:flutter/material.dart';
import 'package:quiz_app/dummy_db.dart';
import 'package:quiz_app/utils/color_constant.dart';
import 'package:quiz_app/view/question_screen/question_screen.dart';

class ResultScreen extends StatefulWidget {
  final int rightaswercount;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.rightaswercount,
    required this.totalQuestions,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int starcount = 0;

  @override
  void initState() {
    calculatefn();
    super.initState();
  }

  void calculatefn() {
    double percentage = widget.rightaswercount / widget.totalQuestions * 100;

    if (percentage >= 80) {
      starcount = 3;
    } else if (percentage >= 50) {
      starcount = 2;
    } else if (percentage >= 30) {
      starcount = 1;
    } else {
      starcount = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconstants.Scaffoldbgcolor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: Center(
          child: Column(
            children: [
              // Star Display
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15, bottom: index == 1 ? 30 : 0),
                    child: Icon(
                      Icons.star,
                      size: index == 1 ? 80 : 50,
                      color: index < starcount && starcount != 0
                          ? Colorconstants.goldenyellowcolor
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Congratulations Text
              Text(
                "Congratulations",
                style: TextStyle(
                  color: Colorconstants.goldenyellowcolor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              // Score Display
              Column(
                children: [
                  Text(
                    "Your Score",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colorconstants.textColor,
                    ),
                  ),
                  Text(
                    "${widget.rightaswercount}/${widget.totalQuestions}",
                    style: TextStyle(
                      color: Colorconstants.goldenyellowcolor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Restart Button
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionsScreen(
                        Questionlist: Dummydb.Questionslist,
                      ),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colorconstants.textColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.restart_alt,
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Restart",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
