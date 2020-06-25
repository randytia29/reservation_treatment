part of 'services.dart';

class ProductServices {
  static Future<List<Product>> getProduct({http.Client client}) async {
    String url =
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
    client ??= http.Client();
    var response = await client.get(url);
    if (response.statusCode != 200) {
      return [];
    }
    List data = json.decode(response.body);
    return data.map((e) => Product.fromJson(e)).toList();
  }

  static Future<ProductDetail> getDetails(Product product,
      {int productID, http.Client client}) async {
    String url =
        'http://makeup-api.herokuapp.com/api/v1/products/${productID ?? product.id}.json';
    client ??= http.Client();
    var response = await client.get(url);
    var data = json.decode(response.body);
    return productID != null
        ? ProductDetail(Product.fromJson(data))
        : ProductDetail(product);
  }
}
