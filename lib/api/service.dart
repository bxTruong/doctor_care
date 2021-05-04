import 'package:dio/dio.dart';
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
    final response = await Dio().get(
        'http://api.izilife.vn/api/mobile/mobile.asmx/clinicList?mID=4&lat=21.024004599999998&log=105.79381839999999&hot=false&type=1&find=&tinhTP=0&qH=0&dPho=&page=1&recod=20');
    /* final response = await Network().get(
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
    );*/
    List<Clinic> clinicList = [];
    Logger().e('statusCode', response.statusCode);
    if (response.statusCode == 200) {
      var jsonRaw = response.data;
      Logger().d(response.data);

      /* List<dynamic> data = jsonRaw["data"];
      print(data.length);

      data.forEach((element) {
        clinicList.add(Clinic.fromJson(element));
      });*/
      return clinicList;
    } else {
      Logger().e('statusCode', response.statusCode);
    }
    return null;
  }


}
