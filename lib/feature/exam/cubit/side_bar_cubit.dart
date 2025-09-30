import 'package:flutter_bloc/flutter_bloc.dart';

class SideBarCubit extends Cubit<bool> {
  SideBarCubit() : super(false);
  void toggleSideBar() {
    emit(!state);
  }
}
