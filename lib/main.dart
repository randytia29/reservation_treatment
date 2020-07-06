import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reservationtreatment/bloc/blocs.dart';
import 'package:reservationtreatment/services/services.dart';
import 'package:reservationtreatment/ui/pages/onboarding.dart';
import 'package:reservationtreatment/ui/pages/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(StreamProvider.value(
    value: AuthServices.userStream,
    child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc()),
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => ProductBloc()..add(FetchProduct())),
        BlocProvider(create: (_) => TicketBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: initScreen == 0 || initScreen == null ? 'first' : '/',
        routes: {
          '/': (context) => Wrapper(),
          'first': (context) => OnBoarding()
        },
        // home: Wrapper(),
      ),
    ),
  ));
}
