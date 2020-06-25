part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);
    if (firebaseUser == null) {
      if (!(prefPageEvent is GoToLoginPage)) {
        prefPageEvent = GoToLoginPage();
        context.bloc<PageBloc>().add(prefPageEvent);
      }
    } else {
      if (!(prefPageEvent is GoToMainPage)) {
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        context.bloc<TicketBloc>().add(GetTickets(firebaseUser.uid));
        prefPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(prefPageEvent);
      }
    }
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnLoginPage)
            ? LoginPage()
            : (pageState is OnRegistrationPage)
                ? RegistrationPage()
                : (pageState is OnProductDetailPage)
                    ? ProductDetailPage(pageState.product)
                    : (pageState is OnConfirmationBookPage)
                        ? ConfirmationBookPage(pageState.ticket)
                        : (pageState is OnTicketPage)
                            ? TicketPage()
                            : MainPage());
  }
}
