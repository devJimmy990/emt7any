import 'package:emt7any/core/constants/end_points.dart';
import 'package:emt7any/core/helper/api_consumer.dart';

class StudentDataSource {
  StudentDataSource(this._consumer);
  final ApiConsumer _consumer;

  Future<Map<String, dynamic>?> login(Map<String, dynamic> payload) async {
    try {
      final res = await _consumer.post(EndPoints.login, data: payload);
      return (res.data as Map<String, dynamic>)["data"];

      // return Future.delayed(
      //   const Duration(seconds: 2),
      //   () => {
      //     "user": {
      //       "id": 5,
      //       "name": "طارق هشام سيد الفرماوى",
      //       "email": "tarekelfarmawy@outlook.com",
      //       "phone": "01010869006",
      //       "national_id": "12345678909998",
      //       "user_type": "student",
      //       "is_active": true,
      //       "email_verified_at": "2025-09-22T18: 03: 37.000000Z",
      //       "created_at": "2025-09-22T15: 19: 37.000000Z",
      //       "updated_at": null,
      //       "student_id": 1,
      //       "student_code": "studentTest",
      //       "seat_number": "1010101",
      //       "academic_year": "first",
      //       "section": "scientific",
      //       "birth_date": "1999-05-29T21: 00: 00.000000Z",
      //       "gender": "male",
      //       "guardian_phone": "01010869000",
      //       "is_banned": false,
      //       "school": {
      //         "id": 1,
      //         "name": " مدرسة السعيدية",
      //         "code": "happySchoolxD",
      //         "governorate": "الجيزة",
      //       },
      //     },
      //     "access_token": "64|fOXYm607TUEhvpt4sKTXN5UhdKbo1rwDIZu8CuFm78b41ee7",
      //     "token_type": "Bearer",
      //     "expires_at": "2025-10-29T11: 32: 55.000000Z",
      //   },
      // );
    } catch (e) {
      rethrow;
    }
  }
}
