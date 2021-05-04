import 'package:doctor_care/model/clinic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ListView listViewClinic(List<Clinic> clinicList) {
  return ListView.builder(
      itemCount: clinicList.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Expanded(
            child: Column(
              children: [Text('${clinicList[index].name}')],
            ),
          ),
        );
      });
}
