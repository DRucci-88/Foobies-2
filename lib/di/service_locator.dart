import 'package:dio/dio.dart';
import 'package:foobies_app/data/network/api/edamam_dio_client.dart';
import 'package:foobies_app/data/network/api/user/edamam_api.dart';
import 'package:foobies_app/data/repository/edamam_repository.dart';
import 'package:get_it/get_it.dart';

// import '../data/network/api/dio_client.dart';
// import '../data/network/api/user/user_api.dart';
// import '../data/repository/user_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(EdamamDioClient(getIt<Dio>()));
  getIt.registerSingleton(EdamamApi(edamamDioClient: getIt<EdamamDioClient>()));
  getIt.registerSingleton(EdamamRepository(getIt.get<EdamamApi>()));

  // getIt.registerSingleton(Dio());
  // getIt.registerSingleton(DioClient(getIt<Dio>()));
  // getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  // getIt.registerSingleton(UserRepository(getIt.get<UserApi>()));
}
