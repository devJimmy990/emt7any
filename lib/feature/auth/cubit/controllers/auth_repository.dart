import 'package:emt7any/feature/auth/cubit/controllers/auth_data_source.dart';

class AuthRepository {
  AuthRepository(this._dataSource);
  final AuthDataSource _dataSource;

  Future<Map<String, dynamic>?> login({
    required String id,
    required String password,
  }) => _dataSource.login(id: id, password: password);
}
