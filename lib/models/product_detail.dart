part of 'models.dart';

class ProductDetail extends Product {
  ProductDetail(Product product)
      : super(
            id: product.id,
            name: product.name,
            price: product.price,
            image: product.image,
            description: product.description);

  @override
  List<Object> get props => super.props;
}
