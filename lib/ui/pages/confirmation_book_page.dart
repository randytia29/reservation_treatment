part of 'pages.dart';

class ConfirmationBookPage extends StatelessWidget {
  final Ticket ticket;

  ConfirmationBookPage(this.ticket);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      context.bloc<PageBloc>().add(GoToProductDetailPage(ticket.product));
      return;
    }, child: Scaffold(
      body: Container(
        child: Center(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah yakin memesan?\n${(userState as UserLoaded).user.name}',
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      onPressed: () {
                        context.bloc<TicketBloc>().add(BuyTicket(
                            ticket, (userState as UserLoaded).user.id));
                        context.bloc<PageBloc>().add(GoToMainPage());
                      },
                      child: Text('Tentu saja yakin'),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    ));
  }
}
