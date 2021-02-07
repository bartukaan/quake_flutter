import 'package:quake_flutter/models/quake_model.dart';
import 'package:quake_flutter/services/quake_service.dart';

import '../locator.dart';

class QuakeRepository {
  QuakeService quakeService = getIt<QuakeService>();

  Future<QuakeModel> getQuake() async {
    return await quakeService.getLastQuakes();
  }

}

