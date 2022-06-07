import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/pages/profile/ui/analysis_detail.dart';

class AnalysisProvider extends BaseBloc {
  List<String> analysis = [
    'Blood test',
    'CSA test',
    'Java test',
    'Algorithms test',
    'English test',
    'Angular test',
    'Spring test',
    'SQL test',
    'Mobile test',
    'Cisco test',
    'Design patterns test',
    'OS test',
    'Krasavcik test',
    'Prosto test',
    'Ne prosto test test',
  ];

  toAnalysisDetail(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AnalysisDetail()));
  }
}
