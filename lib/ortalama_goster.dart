// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama_application/constants/app_constant.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int ders_sayisi;
  const OrtalamaGoster(
      {required this.ders_sayisi, required this.ortalama, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(ders_sayisi>0 ? "$ders_sayisi Ders Girildi":"Ders Giriniz",style: Sabitler.Ortalamastyle,),
          Text(ortalama>=0 ? "${ortalama.toStringAsFixed(2)}":"0.0",style: Sabitler.Ortalamasayi,),
          Text("Ortalama",style: Sabitler.Ortalamastyle,),
        ],
      ),
    );
  }
}
