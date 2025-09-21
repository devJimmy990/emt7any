import 'package:emt7any/core/helper/api_consumer.dart';

class AuthDataSource {
  AuthDataSource(this._consumer);
  final ApiConsumer _consumer;

  Future<Map<String, dynamic>?> login({
    required String id,
    required String password,
  }) {
    try {
      // _consumer.post(EndPoints.login, data: {'id': id, 'password': password});
      return Future.delayed(
        const Duration(seconds: 2),
        () => _db.firstWhere(
          (element) => element['id'] == id && element['password'] == password,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}

final List<Map<String, dynamic>> _db = [
  {"id": "29911040200519", "phone": "01289223643", "password": "01112345678"},
  {"id": "30212190201629", "phone": "01289223643", "password": "01212345678"},
  {"id": "29911040200519", "phone": "01289223643", "password": "01312345678"},
];
