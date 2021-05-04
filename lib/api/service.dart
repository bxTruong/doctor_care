import 'dart:convert';

import 'package:doctor_care/model/clinic.dart';
import 'package:logger/logger.dart';

import 'api_const.dart';
import 'net_work.dart';

class Service {
  static Future<List<Clinic>> getClinicList(
      {int mID,
      double lat,
      double log,
      bool hot,
      int type,
      String find,
      int tinhTP,
      int qH,
      String dPho,
      int page,
      int recod}) async {
    final response = await Network().get(
      url: ApiConst.CLINIC_LIST,
      params: {
        'mID': mID,
        'lat': lat,
        'log': log,
        'hot': hot,
        'type': type,
        'find': find,
        'tinhTP': tinhTP,
        'qH': qH,
        'dPho': dPho,
        'page': page,
        'recod': recod,
      },
    );
    List<Clinic> clinicList = [];
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.data)["data"];
      data.forEach((element) {
        clinicList.add(Clinic.fromJson(element));
      });
      return clinicList;
    } else {
      Logger().e('statusCode', response.statusCode);
    }
    return null;
  }
}
