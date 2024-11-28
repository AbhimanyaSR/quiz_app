class CategoryItem {
  final String title;
  final String iconUrl;
  final List<Map>? questionList; // This should be nullable

  CategoryItem({
    required this.title,
    required this.iconUrl,
    this.questionList, // No need to make it required, allow it to be null
  });
}
