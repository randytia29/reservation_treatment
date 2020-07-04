import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservationtreatment/models/models.dart';
import 'package:reservationtreatment/services/services.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserState initialState) : super(initialState);

  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      User user = await UserServices.getUser(event.id);
      yield UserLoaded(user);
    } else if (event is SignOut) {
      yield UserInitial();
    }
  }
}
