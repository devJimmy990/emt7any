import 'package:hydrated_bloc/hydrated_bloc.dart';

class TzlmatCubit extends HydratedCubit<List<Map<String, String>>> {
  TzlmatCubit() : super([]);

  void saveVideo(Map<String, String> video) => emit([...state, video]);

  String? getVideo(String id, String year) {
    final match = state.firstWhere(
      (e) => e["exam_id"] == id && e["year"] == year,
      orElse: () => {},
    );
    return match["exam_path"];
  }

  @override
  List<Map<String, String>>? fromJson(Map<String, dynamic> json) {
    final list = json["state"] as List<dynamic>?;

    if (list == null) return [];

    return list.map((e) => Map<String, String>.from(e as Map)).toList();
  }

  @override
  Map<String, dynamic>? toJson(List<Map<String, String>> state) => {
    "state": state,
  };
}
