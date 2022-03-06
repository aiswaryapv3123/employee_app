import 'dart:io';

import 'package:employee_directory_app/src/api/services.dart';
import 'package:employee_directory_app/src/app.dart';
import 'package:employee_directory_app/src/bloc/bloc.dart';
import 'package:employee_directory_app/src/bloc/events.dart';
import 'package:employee_directory_app/src/screens/home_page.dart';
import 'package:employee_directory_app/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Constants.colors[3],
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

