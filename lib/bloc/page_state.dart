part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistrationPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnProductDetailPage extends PageState {
  final Product product;

  OnProductDetailPage(this.product);

  @override
  List<Object> get props => [product];
}

class OnConfirmationBookPage extends PageState {
  final Ticket ticket;

  OnConfirmationBookPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnTicketPage extends PageState {
  @override
  List<Object> get props => [];
}
