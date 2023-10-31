import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama_application/constants/app_constant.dart';

import 'ortalama_hesaplama_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dinamik Ortalama Hesaplama',
      theme: ThemeData(
        primarySwatch: Sabitler.anarenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        
      ),home: OrtalamaHesaplamaApp(),
    );
  }
}
