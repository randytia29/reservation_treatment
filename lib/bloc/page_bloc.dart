import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservationtreatment/models/models.dart';

part 'page_state.dart';

part 'page_event.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToRegistrationPage) {
      yield OnRegistrationPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToProductDetailPage) {
      yield OnProductDetailPage(event.product);
    } else if (event is GoToConfirmationBookPage) {
      yield OnConfirmationBookPage(event.ticket);
    } else if (event is GoToTicketPage) {
      yield OnTicketPage();
    }
  }
}
