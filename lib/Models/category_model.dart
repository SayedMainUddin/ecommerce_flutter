class Category {
  int? id;
  String name;
  String imageUrl;
  bool select = false;


  Category({
    required this.name,
    required this.imageUrl,
    this.select = false,
    this.id,
  });
}