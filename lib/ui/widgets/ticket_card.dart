part of 'widgets.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;

  TicketCard(this.ticket);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(ticket.product.image),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 6,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 154,
                child: Text(
                  ticket.product.name,
                  style: TextStyle(fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                ticket.product.price,
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'Jumlah pesanan: ${ticket.jumlah}',
                style: TextStyle(fontSize: 14),
              )
            ],
          )
        ],
      ),
    );
  }
}
