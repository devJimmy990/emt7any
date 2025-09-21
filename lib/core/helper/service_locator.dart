import 'package:emt7any/core/helper/api_consumer.dart';
import 'package:emt7any/core/helper/shared_preference.dart';
import 'package:emt7any/feature/auth/cubit/auth_cubit.dart';
import 'package:emt7any/feature/auth/cubit/controllers/auth_data_source.dart';
import 'package:emt7any/feature/auth/cubit/controllers/auth_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  await _registerSharedPref();
  await _registerHydratedStorage();
  await _registerAPIConsumer();
  await _registerUserController();
}

Future<void> _registerSharedPref() async {
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);
  sl.registerLazySingleton<SharedPreference>(() => SharedPreference(sl()));
}

Future<void> _registerHydratedStorage() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  // HydratedBloc.storage.clear();
}

Future<void> _registerAPIConsumer() async {
  await dotenv.load();

  sl.registerLazySingleton<ApiConsumer>(
    () => ApiConsumer(dotenv.env['BASE_SERVER_URL'] ?? ""),
  );
}

Future<void> _registerUserController() async {
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSource(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(sl()));
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl()));
}
