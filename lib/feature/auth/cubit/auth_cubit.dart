import 'package:emt7any/feature/auth/cubit/auth_state.dart';
import 'package:emt7any/feature/auth/cubit/controllers/auth_repository.dart';
import 'package:emt7any/feature/auth/model/user.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit(this._repository) : super(const AuthState());
  final AuthRepository _repository;

  Future<void> login({required String id, required String password}) async {
    try {
      emit(state.copyWith(loading: true));
      final result = await _repository.login(id: id, password: password);
      if (result != null) {
        emit(state.copyWith(user: User.fromJson(result), loading: false));
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) => AuthState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(AuthState state) => state.toJson();
}
