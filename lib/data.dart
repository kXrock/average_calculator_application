// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama_application/model/ders.dart';

class DataHelper {
  static List<Ders> tumdersler = [];

  static NotOrtalama() {
    double toplamnot = 0;
    double toplamkredi = 0;

    tumdersler.forEach((element) {
      toplamnot += element.harfdeger * element.kredideger;
      toplamkredi += element.kredideger;
    });
    return toplamnot / toplamkredi;
  }

  static Dersekle(Ders ders) {
    tumdersler.add(ders);
  }

  // ignore: prefer_final_fields
  static List<String> _tumderslerinharfleri() {
    return [
      "AA",
      "BA",
      "BB",
      "CB",
      "CC",
      "DC",
      "DD",
      "FF",
    ];
  }

  static double harfinotacevir(String harf) {
    switch (harf) {
      case "AA":
        return 4.0;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FF":
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinharfleri() {
    return _tumderslerinharfleri()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: harfinotacevir(e),
            ))
        .toList();
  }

  static List<int> derssayilari() {
    return List.generate(10, (index) => index + 1);
  }

  static List<DropdownMenuItem<int>> DersSayilarilast() {
    return derssayilari()
        .map(
          (e) => DropdownMenuItem(
            child: Text(
              e.toString(),
            ),
            value: e,
          ),
        )
        .toList();
  }
}
