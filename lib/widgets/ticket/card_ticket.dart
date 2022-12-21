import 'package:flutter/material.dart';
import 'package:w_vaccine/dependency_injection/ticket_data.dart';
import 'package:w_vaccine/features/ticket/page/detail_ticket_page.dart';
import 'package:w_vaccine/styles/custom_color.dart';

class CardTicket extends StatelessWidget {
  const CardTicket({
    super.key,
    required this.td,
  });

  /// Ticket Detail
  final TicketDetail td;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 13),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 5,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DetailTicketPage(td: td);
                // return TicketVaccineCompleted();
                // return TicketVaccineProcess();
              },
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                /// Name and Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      td.name ?? 'Unknown',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (td.status == 'process'
                            ? bgfntcolorprs
                            : bgfntcolordone),
                        // backgroundColor: bgfntcolorprs,
                        // backgroundColor: bgfntcolordone,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {},
                      child: Text(
                        td.status ?? '',
                        style: TextStyle(
                            fontSize: 16,
                            color: (td.status == 'process'
                                ? fntcolorprs
                                : fntcolordone)
                            // color: fntcolorprs,
                            // color: fntcolordone,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                /// Number queue and time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "No Antrian : ${td.queue}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${td.startTime} - ${td.endTime}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                /// Variety Vaccine and n-th dosis
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/1.png",
                      width: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      td.vaccine ?? 'Unknown',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Dosis ${td.dosis}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                /// Medical Facility Location
                Row(
                  children: [
                    Image.asset(
                      "assets/2.png",
                      width: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      td.hospitalName ?? 'Unknown',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                /// Date
                Center(
                  child: Text(
                    td.convertDate ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
