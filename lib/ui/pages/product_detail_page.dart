part of 'pages.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage(this.product);

  @override
  Widget build(BuildContext context) {
    ProductDetail productDetail;
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
        body: FutureBuilder(
          future: ProductServices.getDetails(product),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              productDetail = snapshot.data;
              return Container(
                margin: EdgeInsets.fromLTRB(24, 30, 24, 0),
                child: ListView(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(productDetail.image),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(productDetail.name),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('USD ${productDetail.price}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(productDetail.description),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: BlocBuilder<UserBloc, UserState>(
                        builder: (_, userState) {
                          if (userState is UserLoaded) {
                            return RaisedButton(
                                child: Text('Booking'),
                                onPressed: () {
                                  context.bloc<PageBloc>().add(
                                      GoToConfirmationBookPage(Ticket(
                                          product: productDetail,
                                          name: userState.user.name)));
                                });
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    )
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
