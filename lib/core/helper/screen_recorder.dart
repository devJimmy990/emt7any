import 'dart:io';

import 'package:flutter_screen_recording/flutter_screen_recording.dart';
import 'package:path_provider/path_provider.dart';

class ScreenRecorder {
  static Future<bool> start() async => FlutterScreenRecording.startRecordScreen(
    "videoName",
    titleNotification: "تسجيل الشاشة",
    messageNotification:
        "يجب تفعيل تسجيل الشاشة لبدء الامتحان..برجاء العلم ان هذه الخدمة مهمة لحفظ الاجابات  للتظلمات ",
  );

  static Future<String?> stop(String fileName) async => FlutterScreenRecording
      .stopRecordScreen
      .then((path) => _saveRecordingPath(path, fileName));

  static Future<String?> _saveRecordingPath(
    String path,
    String fileName,
  ) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File(path);

      if (await file.exists()) {
        final newPath = "${dir.path}/$fileName.mp4";
        final newFile = await file.copy(newPath);
        return newFile.path;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
