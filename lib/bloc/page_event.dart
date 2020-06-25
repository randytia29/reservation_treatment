part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToRegistrationPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToProductDetailPage extends PageEvent {
  final Product product;

  GoToProductDetailPage(this.product);

  @override
  List<Object> get props => [product];
}

class GoToConfirmationBookPage extends PageEvent {
  final Ticket ticket;

  GoToConfirmationBookPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoToTicketPage extends PageEvent {
  @override
  List<Object> get props => [];
}
