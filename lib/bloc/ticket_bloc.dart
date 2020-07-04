import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:reservationtreatment/bloc/ticket_event.dart';
import 'package:reservationtreatment/bloc/ticket_state.dart';
import 'package:reservationtreatment/models/models.dart';
import 'package:reservationtreatment/services/services.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc(TicketState initialState) : super(initialState);

  TicketState get initialState => TicketState([]);

  @override
  Stream<TicketState> mapEventToState(
    TicketEvent event,
  ) async* {
    if (event is BuyTicket) {
      await TicketServices.saveTicket(event.userId, event.ticket);
      List<Ticket> tickets = state.tickets + [event.ticket];
      yield TicketState(tickets);
    } else if (event is GetTickets) {
      List<Ticket> tickets = await TicketServices.getTickets(event.userId);
      yield TicketState(tickets);
    }
  }
}
