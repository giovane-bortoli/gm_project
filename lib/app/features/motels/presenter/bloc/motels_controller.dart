import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gm_project/app/features/motels/presenter/bloc/motels_state.dart';

class MotelsController extends Cubit<MotelsState> {
  MotelsController() : super(MotelsInitialState());
}
