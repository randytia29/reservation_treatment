part of 'pages.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F7F9),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(24, 30, 24, 0),
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFF951A26)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Selamat Datang',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) {
                      if (userState is UserLoaded) {
                        return Text(
                          userState.user.name,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        );
                      } else {
                        return SpinKitFadingCircle(
                          color: Color(0xFFF7EE81),
                          size: 50,
                        );
                      }
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 0, 20),
              child: Text(
                'Treatment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 270,
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (_, productState) {
                  if (productState is ProductLoaded) {
                    List<Product> products =
                        productState.product.sublist(0, 10);
                    return ListView.builder(
                        itemCount: products.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => Container(
                            margin: EdgeInsets.only(
                                left: (index == 0) ? 24 : 16,
                                right: (index == products.length - 1) ? 24 : 0),
                            child: ProductCard(
                              products[index],
                              onTap: () {
                                context.bloc<PageBloc>().add(
                                    GoToProductDetailPage(products[index]));
                              },
                            )));
                  } else {
                    return SpinKitFadingCircle(
                      color: Color(0xFF951A26),
                      size: 50,
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 0, 20),
              child: Text(
                'Coming Soon',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 270,
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (_, productState) {
                  if (productState is ProductLoaded) {
                    List<Product> products =
                        productState.product.sublist(10, 20);
                    return ListView.builder(
                        itemCount: products.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => Container(
                            margin: EdgeInsets.only(
                                left: (index == 0) ? 24 : 16,
                                right: (index == products.length - 1) ? 24 : 0),
                            child: ProductCard(products[index])));
                  } else {
                    return SpinKitFadingCircle(
                      color: Color(0xFF951A26),
                      size: 50,
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RaisedButton(
                elevation: 0,
                onPressed: () {
                  context.bloc<PageBloc>().add(GoToTicketPage());
                },
                child: Text('Lihat pesanan'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RaisedButton(
                elevation: 0,
                onPressed: () async {
                  context.bloc<UserBloc>().add(SignOut());
                  await AuthServices.signOut();
                },
                child: Text('Log Out'),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ));
  }
}
