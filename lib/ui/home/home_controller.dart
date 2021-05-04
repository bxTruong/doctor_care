import 'dart:async';

import 'package:doctor_care/api/service.dart';
import 'package:doctor_care/model/clinic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  TabController tabController;

  PermissionStatus sttLocation;
  LocationData _locationData;
  var location = Location();

  bool isLoading = true;

  Future<void> listenForPermission() async {
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    sttLocation = await location.hasPermission();
    if (sttLocation == PermissionStatus.denied) {
      sttLocation = await location.requestPermission();
      if (sttLocation != PermissionStatus.granted) {
        return;
      }
    }

    update();
  }

/*  void listenForPermission() async {
    final whenInUse = await Permission.locationWhenInUse.status;
    final always = await Permission.locationAlways.status;
    print(whenInUse);
    if (whenInUse == PermissionStatus.denied &&
        always == PermissionStatus.denied) {
      requestForPermission();
    }
  }

  Future<void> requestForPermission() async {
    final requestWhenInUse = await Permission.locationWhenInUse.request();
    final requestAlways = await Permission.locationAlways.request();
    sttWhenInUse = requestWhenInUse;
    sttAlways = requestAlways;
    print('$sttWhenInUse and $sttAlways');
  }*/

  @override
  void onInit() {
    super.onInit();
    listenForPermission();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  List<Clinic> clinicList = [];

  Future<void> initTabBarView(int type) async {
    _locationData = await location.getLocation();
    if(_locationData!=0){
      Logger().d('location2', _locationData);
      var clinicListApi = await Service.getClinicList(
          mID: 4,
          lat: _locationData.latitude,
          log: _locationData.longitude,
          hot: false,
          tinhTP: 0,
          qH: 0,
          dPho: '',
          page: 1,
          recod: 20,
          find: '',
          type: type);
      clinicList = clinicListApi;
      if (clinicList.length != 0) {
        isLoading = false;
        update();
      }
    }
  }
}
