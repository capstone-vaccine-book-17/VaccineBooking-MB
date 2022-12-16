import 'package:flutter/material.dart';
import 'package:w_vaccine/dependency_injection/ticket_data.dart';
import 'package:w_vaccine/widgets/ticket/card_ticket.dart';

class TicketCompleted extends StatelessWidget {
  const TicketCompleted({super.key, required this.tickets});

  final List<TicketDetail> tickets;

  @override
  Widget build(BuildContext context) {
    print("Ticket Completed");
    print(tickets);
    return ListView.separated(
      itemBuilder: (context, index) {
        return CardTicket(td: tickets[index]);
      },
      separatorBuilder: (_, __) {
        return const SizedBox(width: 10);
      },
      itemCount: tickets.length,
    );
  }
}
