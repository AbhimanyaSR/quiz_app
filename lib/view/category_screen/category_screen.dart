import 'package:flutter/material.dart';
import 'package:quiz_app/dummy_db.dart'; // Assuming this contains the Dummydb class
import 'package:quiz_app/model/category_item.dart'; // Model for CategoryItem
import 'package:quiz_app/view/category_screen/widgets/category_card.dart'; // Custom CategoryCard widget
import 'package:quiz_app/view/question_screen/question_screen.dart'; // Question screen that will show quiz questions

class CategoryPage extends StatelessWidget {
  final List<CategoryItem> categories = [
    CategoryItem(
      title: "Biology",
      iconUrl: "https://cdn-icons-png.flaticon.com/128/902/902493.png",
      questionList:
          Dummydb.Biologylist, // Linking biology questions from Dummydb
    ),
    CategoryItem(
      title: "Chemistry",
      iconUrl: "https://cdn-icons-png.flaticon.com/128/2158/2158320.png",
      questionList: Dummydb.Chemistry, // Chemistry questions
    ),
    CategoryItem(
      title: "Mathematics",
      iconUrl: "https://cdn-icons-png.flaticon.com/128/3771/3771278.png",
      questionList: Dummydb.mathslist, // Math questions
    ),
    CategoryItem(
      title: "Physics",
      iconUrl: "https://cdn-icons-png.flaticon.com/128/3463/3463594.png",
      questionList: Dummydb.physicslist, // Physics questions
    ),
    CategoryItem(
      title: "General Knowledge",
      iconUrl: "https://cdn-icons-png.flaticon.com/128/13565/13565345.png",
      questionList: Dummydb.gklist, // General Knowledge questions
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryCard(
              title: category.title,
              iconUrl: category.iconUrl,
              onTap: () {
                // Check if category.questionList is null before navigating
                if (category.questionList != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionsScreen(
                        Questionlist: category
                            .questionList!, // Force unwrap since it's guaranteed to be non-null here
                      ),
                    ),
                  );
                } else {
                  // Handle the case where questionList is null
                  print("No questions available for this category");
                }
              },
            );
          },
        ),
      ),
    );
  }
}
