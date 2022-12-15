import 'dart:async';
import 'dart:core';
import 'package:w_vaccine/data/service/api/ticket_api.dart';
import 'package:w_vaccine/dependency_injection/session_data.dart';
import 'package:w_vaccine/dependency_injection/ticket_data.dart';
import 'package:w_vaccine/features/ticket/page/ticket_all.dart';
import 'package:w_vaccine/features/ticket/page/ticket_complated.dart';

class TicketRepository {
  final TicketApi _ticketApi;

  TicketRepository(this._ticketApi);

  Future<List<TicketData>> allTicket({
    required String token,
  }) async {
    try {
      final res = await _ticketApi.getAllTicket(token: token);
      final tv = (res.data['data'] as List)
          .map((e) => TicketData.fromJson(e))
          .toList();
      return tv;
    } catch (e) {
      print('Booking ID - ${e.toString()}');

      rethrow;
    }
  }

  Future<List<TicketData>> ticketProcess({
    required String token,
  }) async {
    try {
      final res = await _ticketApi.getTicketOnProcess(token: token);
      final tv = (res.data['data'] as List)
          .map((e) => TicketData.fromJson(e))
          .toList();
      return tv;
    } catch (e) {
      print('Ticket Process - ${e.toString()}');

      rethrow;
    }
  }

  Future<List<SessionData>> ticketFinish({
    required String token,
  }) async {
    try {
      final res = await _ticketApi.getTicketFinish(token: token);
      final finish = (res.data['data'] as List)
          .map((e) => SessionData.fromJson(e))
          .toList();

      return finish;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> ticketByIdBooking({
    required String token,
  }) async {
    try {
      final res = await _ticketApi.getTicketByIdBooking(
        token: token,
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
