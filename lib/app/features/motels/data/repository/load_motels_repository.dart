import 'package:gm_project/app/features/motels/data/models/motel_models.dart';
import 'package:gm_project/app/features/motels/domain/errors/load_motels_failure.dart';

abstract interface class LoadMotelsRepository {
  Future<(List<MotelModels>, MotelLoadFailure?)> loadMotels();
}
