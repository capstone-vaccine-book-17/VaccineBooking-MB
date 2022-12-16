import 'package:w_vaccine/data/service/api/ticket_api.dart';
import 'package:w_vaccine/dependency_injection/ticket_data.dart';

class TicketRepository {
  final TicketApi _ticketApi;

  TicketRepository(this._ticketApi);

  Future<List<TicketDetail>> allTicket({
    required String token,
  }) async {
    try {
      final res = await _ticketApi.getAllTicket(token: token);
      final List<TicketDetail> tickets = ((res.data['data'] ?? []) as List)
          .map((e) => TicketDetail.fromJson(e))
          .toList();
      return tickets;
    } catch (e) {
      print('Error - All Tickets');
      rethrow;
    }
  }
}
