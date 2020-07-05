import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservationtreatment/models/models.dart';
import 'package:reservationtreatment/services/services.dart';

part 'product_state.dart';

part 'product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is FetchProduct) {
      List<Product> product = await ProductServices.getProduct();
      yield ProductLoaded(product: product);
    }
  }
}
