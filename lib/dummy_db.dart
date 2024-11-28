class Dummydb {
  // Combined list of all categories
  static List<Map> Questionslist = [
    ...Biologylist,
    ...Chemistry,
    ...mathslist,
    ...physicslist,
    ...gklist,
  ];

  // Method to fetch random questions
  static List<Map> getRandomQuestions(int count) {
    final shuffled = List<Map>.from(Questionslist)..shuffle();
    return shuffled.take(count).toList();
  }

  // Method to validate questions
  static void validateQuestions() {
    for (var question in Questionslist) {
      if (question['answer'] >= question['options'].length) {
        throw Exception(
            "Invalid answer index in question: ${question['question']}");
      }
    }
  }

  // Biology List with categories and difficulty
  static List<Map> Biologylist = [
    {
      "id": 1,
      "category": "Biology",
      "difficulty": "Easy",
      "question": "What is the powerhouse of the cell?",
      "options": ["Nucleus", "Ribosome", "Mitochondria", "Chloroplast"],
      "answer": 2
    },
    {
      "id": 2,
      "category": "Biology",
      "difficulty": "Medium",
      "question": "Which organ in the human body filters blood?",
      "options": ["Heart", "Liver", "Kidney", "Lungs"],
      "answer": 2
    },
    {
      "id": 3,
      "category": "Biology",
      "difficulty": "Easy",
      "question": "What is the basic unit of life?",
      "options": ["Atom", "Cell", "Molecule", "Organ"],
      "answer": 1
    },
    {
      "id": 4,
      "category": "Biology",
      "difficulty": "Hard",
      "question": "Which part of the plant is responsible for photosynthesis?",
      "options": ["Root", "Stem", "Leaf", "Flower"],
      "answer": 2
    },
    {
      "id": 5,
      "category": "Biology",
      "difficulty": "Medium",
      "question": "Which blood group is known as the universal donor?",
      "options": ["A", "B", "O", "AB"],
      "answer": 2
    },
    {
      "id": 6,
      "category": "Biology",
      "difficulty": "Hard",
      "question": "What is the human body’s largest organ?",
      "options": ["Heart", "Liver", "Skin", "Brain"],
      "answer": 2
    }
  ];

  // Chemistry List with categories and difficulty
  static List<Map> Chemistry = [
    {
      "id": 1,
      "category": "Chemistry",
      "difficulty": "Easy",
      "question": "What is the chemical symbol for gold?",
      "options": ["Au", "Ag", "Fe", "Pb"],
      "answer": 0
    },
    {
      "id": 2,
      "category": "Chemistry",
      "difficulty": "Medium",
      "question": "What is the pH of pure water?",
      "options": ["5", "7", "9", "14"],
      "answer": 1
    },
    {
      "id": 3,
      "category": "Chemistry",
      "difficulty": "Easy",
      "question": "Which gas is most abundant in Earth's atmosphere?",
      "options": ["Oxygen", "Hydrogen", "Nitrogen", "Carbon dioxide"],
      "answer": 2
    },
    {
      "id": 4,
      "category": "Chemistry",
      "difficulty": "Hard",
      "question": "What is the common name for H2O2?",
      "options": [
        "Water",
        "Hydrogen Peroxide",
        "Hydrogen Sulfide",
        "Hydrochloric Acid"
      ],
      "answer": 1
    },
    {
      "id": 5,
      "category": "Chemistry",
      "difficulty": "Medium",
      "question": "Who is known as the father of modern chemistry?",
      "options": [
        "Isaac Newton",
        "Albert Einstein",
        "Marie Curie",
        "Antoine Lavoisier"
      ],
      "answer": 3
    },
    {
      "id": 6,
      "category": "Chemistry",
      "difficulty": "Hard",
      "question": "What is the atomic number of carbon?",
      "options": ["6", "8", "12", "14"],
      "answer": 0
    }
  ];

  // Maths List with categories and difficulty
  static List<Map> mathslist = [
    {
      "id": 1,
      "category": "Maths",
      "difficulty": "Easy",
      "question": "What is the value of Pi (π) to two decimal places?",
      "options": ["3.14", "3.15", "3.16", "3.17"],
      "answer": 0
    },
    {
      "id": 2,
      "category": "Maths",
      "difficulty": "Medium",
      "question": "What is the derivative of sin(x)?",
      "options": ["cos(x)", "-cos(x)", "tan(x)", "-sin(x)"],
      "answer": 0
    },
    {
      "id": 3,
      "category": "Maths",
      "difficulty": "Easy",
      "question": "What is 25% of 200?",
      "options": ["25", "50", "100", "75"],
      "answer": 1
    },
    {
      "id": 4,
      "category": "Maths",
      "difficulty": "Hard",
      "question": "What is 7 factorial (7!)?",
      "options": ["720", "5040", "40320", "362880"],
      "answer": 1
    },
    {
      "id": 5,
      "category": "Maths",
      "difficulty": "Medium",
      "question": "What is the sum of angles in a triangle?",
      "options": ["90°", "180°", "360°", "270°"],
      "answer": 1
    },
    {
      "id": 6,
      "category": "Maths",
      "difficulty": "Medium",
      "question": "What is the square root of 144?",
      "options": ["10", "12", "14", "16"],
      "answer": 1
    }
  ];

  // Physics List with categories and difficulty
  static List<Map> physicslist = [
    {
      "id": 1,
      "category": "Physics",
      "difficulty": "Hard",
      "question": "Who developed the theory of relativity?",
      "options": [
        "Isaac Newton",
        "Galileo Galilei",
        "Albert Einstein",
        "Niels Bohr"
      ],
      "answer": 2
    },
    {
      "id": 2,
      "category": "Physics",
      "difficulty": "Medium",
      "question": "What is the unit of force?",
      "options": ["Joule", "Pascal", "Newton", "Watt"],
      "answer": 2
    },
    {
      "id": 3,
      "category": "Physics",
      "difficulty": "Hard",
      "question": "What is the speed of light in a vacuum?",
      "options": [
        "3,000 km/s",
        "30,000 km/s",
        "300,000 km/s",
        "3,000,000 km/s"
      ],
      "answer": 2
    },
    {
      "id": 4,
      "category": "Physics",
      "difficulty": "Easy",
      "question": "What is the SI unit of electric current?",
      "options": ["Volt", "Ampere", "Coulomb", "Ohm"],
      "answer": 1
    },
    {
      "id": 5,
      "category": "Physics",
      "difficulty": "Medium",
      "question":
          "Which law states that for every action, there is an equal and opposite reaction?",
      "options": [
        "Newton's First Law",
        "Newton's Second Law",
        "Newton's Third Law",
        "Law of Gravitation"
      ],
      "answer": 2
    },
    {
      "id": 6,
      "category": "Physics",
      "difficulty": "Hard",
      "question": "What is the gravitational constant symbol?",
      "options": ["G", "g", "N", "k"],
      "answer": 0
    }
  ];

  // General Knowledge List with categories and difficulty
  static List<Map> gklist = [
    {
      "id": 1,
      "category": "General Knowledge",
      "difficulty": "Medium",
      "question": "Which is the largest desert in the world?",
      "options": ["Sahara", "Gobi", "Arctic", "Antarctic"],
      "answer": 3
    },
    {
      "id": 2,
      "category": "General Knowledge",
      "difficulty": "Easy",
      "question": "Which country is known as the Land of the Rising Sun?",
      "options": ["China", "Japan", "South Korea", "India"],
      "answer": 1
    },
    {
      "id": 3,
      "category": "General Knowledge",
      "difficulty": "Medium",
      "question": "What is the smallest country in the world?",
      "options": ["Monaco", "Vatican City", "Malta", "Luxembourg"],
      "answer": 1
    },
    {
      "id": 4,
      "category": "General Knowledge",
      "difficulty": "Hard",
      "question": "Which language has the most native speakers?",
      "options": ["English", "Mandarin", "Spanish", "Hindi"],
      "answer": 1
    },
    {
      "id": 5,
      "category": "General Knowledge",
      "difficulty": "Medium",
      "question": "Who was the first person to walk on the moon?",
      "options": [
        "Buzz Aldrin",
        "Yuri Gagarin",
        "Neil Armstrong",
        "Michael Collins"
      ],
      "answer": 2
    },
    {
      "id": 6,
      "category": "General Knowledge",
      "difficulty": "Hard",
      "question": "Which is the longest river in the world?",
      "options": ["Amazon", "Yangtze", "Nile", "Mississippi"],
      "answer": 2
    }
  ];
}
