import 'package:http/http.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/activity/home.dart';
import 'package:weather_app/activity/loading.dart';
import 'package:weather_app/activity/location.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/Loading":(context) => Loading()
      
    },
  ));
}
