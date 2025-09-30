import 'package:emt7any/core/helper/secure_storage.dart';
import 'package:emt7any/core/helper/service_locator.dart';
import 'package:emt7any/feature/auth/cubit/controllers/student_repository.dart';
import 'package:emt7any/feature/auth/cubit/student_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class StudentCubit extends HydratedCubit<StudentState> {
  StudentCubit(this._repository) : super(const StudentState());
  final StudentRepository _repository;

  Future<void> login({required String id, required String password}) async {
    try {
      emit(state.copyWith(loading: true));

      final data = await _repository.login({
        "national_id": id,
        "password": password,
      });

      final (:student, :token) = data;
      await sl<SecureStorage>().writeString("token", token);
      emit(
        state.copyWith(isAuthenticated: true, student: student, loading: false),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }

  Future<void> logout() async {
    emit(state.reset());
    await sl<SecureStorage>().delete("token");
  }

  @override
  StudentState fromJson(Map<String, dynamic> json) =>
      StudentState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(StudentState state) => state.toJson();
}
