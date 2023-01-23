import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../enum.dart';
import '../models/model_list.dart';

class ResultData {
  DataStatus status = DataStatus.unavailable;
  List<Datum?> data = [];

  ResultData(this.status, this.data);
}

Future<ResultData?> getDataReqres() async {
  try {
    var response = await Dio().get('https://reqres.in/api/users?per_page=100');
    if (response.statusCode == 200) {
      if (kDebugMode) (response.data);

      var dataModel = ModelList.fromJson(response.data);
      return ResultData(DataStatus.available, dataModel.data);
    } else if (response.statusCode == 404) {
      return ResultData(DataStatus.notfound, []);
    } else {
      return ResultData(DataStatus.unavailable, []);
    }
  } catch (e) {
    return ResultData(DataStatus.unavailable, []);
  }
}
