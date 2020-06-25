part of 'widgets.dart';

class ProductCard extends StatelessWidget {
  final Product products;
  final Function onTap;

  ProductCard(this.products, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFF7EE81), borderRadius: BorderRadius.circular(8)),
        width: (MediaQuery.of(context).size.width - 64) / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(products.image), fit: BoxFit.cover)),
            ),
            Text(
              products.name,
              style: TextStyle(fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'USD ${products.price}',
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
