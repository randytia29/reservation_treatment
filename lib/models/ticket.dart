part of 'models.dart';

class Ticket extends Equatable {
  final Product product;
  final String name;

  Ticket({this.product, this.name});

  @override
  List<Object> get props => [product, name];
}
