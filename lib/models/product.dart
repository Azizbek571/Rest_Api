class ProductModel {
  int id;
  String title;
  int price;
  String category;
  String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        category: json['category'],
        title: json['title'],
        price: json['price'],
        thumbnail: json['thumbnail'],
        id: json['id']);
  }
}

List<ProductModel> getListFromMap(List list){
  return List<ProductModel>.from(list.map((item) => ProductModel.fromJson(item)));
}
