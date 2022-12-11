import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:w_vaccine/data/repository/auth_repository.dart';
import 'package:w_vaccine/data/repository/family_repository.dart';
import 'package:w_vaccine/data/repository/profile_repository.dart';
import 'package:w_vaccine/data/service/api/auth_api.dart';
import 'package:w_vaccine/data/service/api/family_api.dart';
import 'package:w_vaccine/data/service/api/profile_api.dart';
import 'package:w_vaccine/data/service/dio_client.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/family_data.dart';
import 'package:w_vaccine/dependency_injection/profile_data.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  /// Networking
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  /// Networking API and Repository
  getIt.registerSingleton(AuthApi(getIt<DioClient>()));
  getIt.registerSingleton(AuthRepository(getIt<AuthApi>()));
  getIt.registerSingleton(ProfileApi(getIt<DioClient>()));
  getIt.registerSingleton(ProfileRepository(getIt<ProfileApi>()));
  getIt.registerSingleton(FamilyApi(getIt<DioClient>()));
  getIt.registerSingleton(FamilyRepository(getIt<FamilyApi>()));

  /// Local Storage / Secure Shared Preferences
  getIt.registerSingleton(SharedPref());

  /// Global Variable
  getIt.registerSingleton(ProfileData());
  getIt.registerSingleton(FamilyData());
}
