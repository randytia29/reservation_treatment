part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection =
      Firestore.instance.collection('tickets');

  static Future<void> saveTicket(String id, Ticket ticket) async {
    await ticketCollection.document().setData({
      'productID': ticket.product.id,
      'userID': id ?? '',
      'name': ticket.name,
      'productName': ticket.product.name,
      'price': ticket.product.price,
      'image': ticket.product.image,
      'jumlah': ticket.jumlah
    });
  }

  static Future<List<Ticket>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.getDocuments();
    var documents = snapshot.documents
        .where((document) => document.data['userID'] == userId);
    List<Ticket> tickets = [];
    for (var document in documents) {
      ProductDetail productDetail = await ProductServices.getDetails(null,
          productID: document.data['productID']);
      tickets
          .add(Ticket(product: productDetail, jumlah: document.data['jumlah']));
    }
    return tickets;
  }
}
