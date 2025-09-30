import 'package:emt7any/feature/auth/cubit/controllers/student_data_source.dart';
import 'package:emt7any/feature/auth/model/student.dart';

class StudentRepository {
  StudentRepository(this._dataSource);
  final StudentDataSource _dataSource;

  Future<({Student student, String token})> login(
    Map<String, dynamic> payload,
  ) async {
    try {
      final res = await _dataSource.login(payload);

      if (res == null ||
          (res["user"] as Map<String, dynamic>)["user_type"] != "student") {
        throw Exception("invalid-user-type");
      }

      final student = Student.fromJson(res["user"]);
      final token = res["access_token"] as String;

      return (student: student, token: token);
    } catch (e) {
      rethrow;
    }
  }
}
