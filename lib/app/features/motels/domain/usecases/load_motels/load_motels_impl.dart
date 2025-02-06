import 'package:gm_project/app/features/motels/data/models/motel_models.dart';
import 'package:gm_project/app/features/motels/data/repository/load_motels_repository.dart';
import 'package:gm_project/app/features/motels/domain/errors/load_motels_failure.dart';
import 'package:gm_project/app/features/motels/domain/usecases/load_motels/load_motels.dart';

class LoadMotelsImpl implements LoadMotels {
  final LoadMotelsRepository repository;

  LoadMotelsImpl({required this.repository});

  @override
  Future<(List<MotelModels>, MotelLoadFailure?)> call() {
    return repository.loadMotels();
  }
}
