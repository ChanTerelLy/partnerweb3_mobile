class Ticket {
  final String address;
  final String date;
  final String name;
  final int number;
  final int id;

  Ticket({
    this.id,
    this.address,
    this.date,
    this.name,
    this.number,
  });

  List<Ticket> mapTicketToTickets(List tickets) {
    return tickets.map((t) {
      return Ticket(
          id: t['id'],
          address: t['address'],
          date: t['date'],
          name: t['name'],
          number: t['number']
      );
    }).toList();
  }
}