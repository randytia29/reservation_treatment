part of 'models.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String price;
  final String image;
  final String description;

  Product(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.image,
      @required this.description});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image_link'],
      description: json['description']);

  @override
  List<Object> get props => [id, name, price, image, description];
}
