part of 'pages.dart';

class TicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Daftar pesanan',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                BlocBuilder<TicketBloc, TicketState>(
                  builder: (_, ticketState) {
                    if (ticketState is TicketState) {
                      return ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: ticketState.tickets.length,
                          itemBuilder: (_, index) =>
                              TicketCard(ticketState.tickets[index]));
                    } else {
                      return SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
