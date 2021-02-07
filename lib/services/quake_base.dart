import 'package:quake_flutter/models/quake_model.dart';

abstract class QuakeBase {

  Future<QuakeModel> getLastQuakes();

}