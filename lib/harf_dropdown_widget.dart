import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama_application/constants/app_constant.dart';
import 'package:ortalama_hesaplama_application/data.dart';

class Harf_Dropdown extends StatefulWidget {
  final Function onharfsecildi;
  Harf_Dropdown({required this.onharfsecildi,Key? key}) : super(key: key);

  @override
  State<Harf_Dropdown> createState() => _Harf_DropdownState();
}

class _Harf_DropdownState extends State<Harf_Dropdown> {
  double secilendeger=4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
          color: Sabitler.anarenk.shade500.withOpacity(0.2),
          borderRadius: Sabitler.borderRadius2),
      child: DropdownButton<double>(
        underline: Container(),
        items: DataHelper.tumDerslerinharfleri(),
        value: secilendeger,
        onChanged: (deger) {
          setState(() {
            secilendeger = deger!;
            widget.onharfsecildi(secilendeger);
          });
        },
      ),
    );;
  }
}