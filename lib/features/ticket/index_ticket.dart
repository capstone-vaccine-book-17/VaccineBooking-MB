import 'package:flutter/material.dart';
import 'package:w_vaccine/features/ticket/tab_bar_view/ticket_all.dart';
import 'package:w_vaccine/features/ticket/tab_bar_view/ticket_completed.dart';
import 'package:w_vaccine/features/ticket/tab_bar_view/ticket_waiting_queue.dart';
import 'package:w_vaccine/features/ticket/view_model/index_ticket_view_model.dart';
import 'package:provider/provider.dart';

class IndexTicket extends StatefulWidget {
  const IndexTicket({Key? key}) : super(key: key);

  @override
  State<IndexTicket> createState() => _IndexticketState();
}

class _IndexticketState extends State<IndexTicket> {
  late IndexTicketViewModel vm;

  @override
  void initState() {
    vm = Provider.of<IndexTicketViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.initialLoad(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Ticket Index");

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            title: const Text('Tiket Vaksin'),
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: const Color.fromRGBO(96, 140, 206, 0.5),
              indicatorColor: Colors.blue,
              tabs: ['Semua', 'Menunggu Antrian', ' Selesai'].map((e) {
                return Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        body: Consumer<IndexTicketViewModel>(
          builder: (_, value, __) {
            return TabBarView(
              children: [
                TicketAll(tickets: value.ticketsAll),
                TicketWaitingQueue(tickets: value.ticketsWaitingQueue),
                TicketCompleted(tickets: value.ticketsCompleted),
              ],
            );
          },
        ),
      ),
    );
  }
}
