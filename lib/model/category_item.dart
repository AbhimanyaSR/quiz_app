class CategoryItem {
  final String title;
  final String iconUrl;
  final List<Map>? questionList;

  CategoryItem({
    required this.title,
    required this.iconUrl,
    this.questionList,
  });
}
