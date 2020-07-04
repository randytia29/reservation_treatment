import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reservationtreatment/bloc/blocs.dart';
import 'package:reservationtreatment/bloc/ticket_state.dart';
import 'package:reservationtreatment/services/services.dart';
import 'package:reservationtreatment/ui/pages/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(StreamProvider.value(
    value: AuthServices.userStream,
    child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc(OnInitialPage())),
        BlocProvider(create: (_) => UserBloc(UserInitial())),
        BlocProvider(
            create: (_) => ProductBloc(ProductInitial())..add(FetchProduct())),
        BlocProvider(create: (_) => TicketBloc(TicketState([])))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    ),
  ));
}
