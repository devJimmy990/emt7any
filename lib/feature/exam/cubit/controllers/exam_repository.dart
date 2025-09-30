import 'package:emt7any/feature/exam/cubit/controllers/exam_data_source.dart';
import 'package:emt7any/feature/exam/data/exam.dart';

class ExamRepository {
  ExamRepository(this._dataSource);
  final ExamDataSource _dataSource;
  Future<Exam> getExam() async {
    try {
      final data = await _dataSource.getExam();
      return Exam.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future submitAnswers(Map<String, dynamic> payload) async {
    try {
      await _dataSource.submitAnswers(payload);
    } catch (e) {
      rethrow;
    }
  }
}
