part of 'pages.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage(this.product);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  TextEditingController jumlahController = TextEditingController();
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
          future: ProductServices.getDetails(widget.product),
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
                      child: Row(
                        children: [
                          Text('Jumlah : '),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: jumlahController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          )
                        ],
                      ),
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
                                          name: userState.user.name,
                                          jumlah: jumlahController.text)));
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
