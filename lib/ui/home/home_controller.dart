import 'dart:async';

import 'package:doctor_care/api/service.dart';
import 'package:doctor_care/model/clinic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';

import 'lv_tab_bar_view.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  TabController tabController;

  PermissionStatus sttLocation;
  LocationData _locationData;
  var location = Location();

  bool isLoading = true;

  List<Widget> tabBarView = [];

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
    initTabBarView();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  List<Clinic> clinicList = [];

  Future<void> initTabBarView() async {
    _locationData = await location.getLocation();
    // ignore: unrelated_type_equality_checks
    if (_locationData != 0) {
      for (int i = 1; i <= tabController.length; i++) {
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
            type: i);
        Logger().d('clinicListApi', clinicListApi.length);
        clinicList = clinicListApi;
        if (clinicList.length != 0) {
          tabBarView.add(listViewClinic(clinicList));
          Logger().d('tabBarView', tabBarView.length);
          if (tabBarView.length == tabController.length) {
            Logger().d('tabBarView', tabBarView.length);
            isLoading = false;
            update();
          }
        }
      }
    }
  }
}
