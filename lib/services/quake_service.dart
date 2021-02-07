import 'package:http/http.dart' as http;

import 'package:quake_flutter/models/quake_model.dart';
import 'package:quake_flutter/services/quake_base.dart';

class QuakeService implements QuakeBase{


  @override
  Future<QuakeModel> getLastQuakes() {
    // TODO: implement getLastQuakes
    throw UnimplementedError();
  }


}