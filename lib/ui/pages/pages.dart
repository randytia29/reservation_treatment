import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:reservationtreatment/bloc/blocs.dart';
import 'package:reservationtreatment/bloc/product_bloc.dart';
import 'package:reservationtreatment/bloc/ticket_event.dart';
import 'package:reservationtreatment/bloc/ticket_state.dart';
import 'package:reservationtreatment/models/models.dart';
import 'package:reservationtreatment/services/services.dart';
import 'package:reservationtreatment/shared/shared.dart';
import 'package:reservationtreatment/ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_page.dart';

part 'login_page.dart';

part 'wrapper.dart';

part 'registration_page.dart';

part 'product_detail_page.dart';

part 'confirmation_book_page.dart';

part 'ticket_page.dart';
