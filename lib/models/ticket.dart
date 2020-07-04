part of 'models.dart';

class Ticket extends Equatable {
  final Product product;
  final String name;
  final String jumlah;

  Ticket({this.product, this.name, this.jumlah});

  @override
  List<Object> get props => [product, name, jumlah];
}
