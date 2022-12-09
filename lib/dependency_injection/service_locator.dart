import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:w_vaccine/data/repository/auth_repository.dart';
import 'package:w_vaccine/data/service/api/auth_api.dart';
import 'package:w_vaccine/data/service/dio_client.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(AuthApi(getIt<DioClient>()));
  getIt.registerSingleton(AuthRepository(getIt<AuthApi>()));

  /// Local Storage / Secure Shared Preferences
  getIt.registerSingleton(SharedPref());
}
