import 'package:dio/dio.dart';
import 'package:w_vaccine/data/service/api/constant_api.dart';
import 'package:w_vaccine/data/service/dio_client.dart';
import 'package:w_vaccine/data/service/dio_exception.dart';

class TicketApi {
  final DioClient _dioClient;

  TicketApi(this._dioClient);

  Future<Response> getAllTicket({
    required String token,
  }) async {
    try {
      final Response res = await _dioClient.get(
        '${ConstantApi.ticketEndpoind}/',
        options: Options(
          headers: {"Authorization": 'Bearer $token'},
        ),
      );
      return res;
    } on DioError catch (e) {
      final String errorMsg = DioException.fromDioError(e).toString();
      throw errorMsg;
    }
  }
}
