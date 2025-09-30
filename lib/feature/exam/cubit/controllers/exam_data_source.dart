import 'package:emt7any/core/constants/end_points.dart';
import 'package:emt7any/core/helper/api_consumer.dart';

class ExamDataSource {
  ExamDataSource(this._consumer);
  final ApiConsumer _consumer;

  Future<Map<String, dynamic>> getExam() async {
    try {
      final res = await _consumer.get(EndPoints.getExam);
      if (!res.status) throw res.msg;
      return (res.data as Map<String, dynamic>)["data"];
    } catch (e) {
      rethrow;
    }
  }

  Future submitAnswers(Map<String, dynamic> payload) async {
    try {
      final res = await _consumer.post(EndPoints.submitAnswers, data: payload);
      print("debug: $res");
      if (!res.status) throw res.msg;
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
