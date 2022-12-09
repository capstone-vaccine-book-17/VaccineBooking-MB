import 'package:flutter/material.dart';
import 'package:w_vaccine/features/ticket/ticket_waiting_queue.dart';
import 'package:w_vaccine/features/ticket/ticket_complated.dart';
import 'package:w_vaccine/features/ticket/ticket_all.dart';

class IndexTicket extends StatefulWidget {
  const IndexTicket({Key? key}) : super(key: key);

  @override
  State<IndexTicket> createState() => _IndexticketState();
}

class _IndexticketState extends State<IndexTicket> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: AppBar(
              backgroundColor: Colors.white,
              title: Row(
                children: const [
                  Text(
                    'Tiket Vaksin',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
              bottom: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: const Color.fromRGBO(96, 140, 206, 0.5),
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(
                    child: Column(
                      children: const [
                        Text(
                          'Semua',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text(
                          'Menunggu Antrian',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      children: const [
                        Text(
                          'Selesai',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              TicketAll(),
              WaitingQueue(),
              TicketCompleted(),
            ],
          ),
        ),
      ),
    );
  }
}
