import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama_application/constants/app_constant.dart';
import 'package:ortalama_hesaplama_application/data.dart';

class Sayilar_Dropdown extends StatefulWidget {
  final Function onsayisecildi;

  Sayilar_Dropdown({required this.onsayisecildi ,Key? key}) : super(key: key);

  @override
  State<Sayilar_Dropdown> createState() => _Sayilar_DropdownState();
}

class _Sayilar_DropdownState extends State<Sayilar_Dropdown> {
  int firstnumber=1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
          color: Sabitler.anarenk.shade500.withOpacity(0.2),
          borderRadius: Sabitler.borderRadius2),
      child: DropdownButton<int>(
        underline: Container(),
        items: DataHelper.DersSayilarilast(),
        value: firstnumber,
        onChanged: (deger) {
          setState(() {
            firstnumber = deger!;
            widget.onsayisecildi(firstnumber);
          });
        },
      ),
    );;
  }
}