import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gm_project/app/features/motels/data/models/motel_models.dart';
import 'package:gm_project/app/features/motels/data/repository/load_motels_repository.dart';
import 'package:gm_project/app/features/motels/domain/errors/load_motels_failure.dart';
import 'package:gm_project/app/services/http/custom_client.dart';

class LoadMotelsRepositoryImpl implements LoadMotelsRepository {
  final CustomClient client;

  LoadMotelsRepositoryImpl({required this.client});

  @override
  Future<(List<MotelModels>, MotelLoadFailure?)> loadMotels() async {
    final response = await rootBundle.loadString('lib/app/shared/assets/motels_mock.json');
    final Map<String, dynamic> jsonData = jsonDecode(response);
    final List<MotelModels> motelsList =
        (jsonData['data']['moteis'] as List<dynamic>).map((motel) => MotelModels.fromJson(motel)).toList();
    if (response.isEmpty) {
      return (<MotelModels>[], LoadMotelResponseFailure());
    }

    return (motelsList, null);
  }
}
