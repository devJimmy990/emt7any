import 'package:emt7any/core/helper/api_consumer.dart';
import 'package:emt7any/core/helper/secure_storage.dart';
import 'package:emt7any/core/helper/shared_preference.dart';
import 'package:emt7any/feature/auth/cubit/controllers/student_data_source.dart';
import 'package:emt7any/feature/auth/cubit/controllers/student_repository.dart';
import 'package:emt7any/feature/auth/cubit/student_cubit.dart';
import 'package:emt7any/feature/exam/cubit/controllers/exam_data_source.dart';
import 'package:emt7any/feature/exam/cubit/controllers/exam_repository.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_cubit.dart';
import 'package:emt7any/feature/exam/cubit/side_bar_cubit.dart';
import 'package:emt7any/feature/tzlmat/tzlmat_cubit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  await _registerSharedPref();
  await _registerHydratedStorage();
  await _registerSecureStorage();
  await _registerAPIConsumer();
  await _registerUserController();
  await _registerExamController();
  await _registerTzlmatController();
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
  final token = await sl<SecureStorage>().readString("token");

  sl.registerLazySingleton<ApiConsumer>(
    () => ApiConsumer(dotenv.env['BASE_SERVER_URL'] ?? "", token),
  );
}

Future<void> _registerUserController() async {
  sl.registerLazySingleton<StudentDataSource>(() => StudentDataSource(sl()));
  sl.registerLazySingleton<StudentRepository>(() => StudentRepository(sl()));
  sl.registerLazySingleton<StudentCubit>(() => StudentCubit(sl()));
}

Future<void> _registerExamController() async {
  sl.registerLazySingleton<ExamDataSource>(() => ExamDataSource(sl()));
  sl.registerLazySingleton<ExamRepository>(() => ExamRepository(sl()));
  sl.registerLazySingleton<ExamCubit>(() => ExamCubit(sl()));
  sl.registerLazySingleton<SideBarCubit>(() => SideBarCubit());
}

Future<void> _registerSecureStorage() async {
  sl.registerLazySingleton<SecureStorage>(
    () => SecureStorage(const FlutterSecureStorage()),
  );
}

Future<void> _registerTzlmatController() async {
  sl.registerLazySingleton<TzlmatCubit>(() => TzlmatCubit());
}
