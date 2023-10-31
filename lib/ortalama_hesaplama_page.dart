// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:ortalama_hesaplama_application/data.dart';
import 'package:ortalama_hesaplama_application/ders_listesi.dart';
import 'package:ortalama_hesaplama_application/harf_dropdown_widget.dart';
import 'package:ortalama_hesaplama_application/model/ders.dart';
import 'package:ortalama_hesaplama_application/ortalama_goster.dart';
import 'package:ortalama_hesaplama_application/say%C4%B1lar_dropdown_w.dart';

import 'constants/app_constant.dart';
import 'constants/app_constant.dart';

class OrtalamaHesaplamaApp extends StatefulWidget {
  OrtalamaHesaplamaApp({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplamaApp> createState() => _OrtalamaHesaplamaAppState();
}

class _OrtalamaHesaplamaAppState extends State<OrtalamaHesaplamaApp> {
  double secilendeger = 4;
  int firstnumber = 1;
  final formkey = GlobalKey<FormState>();
  String girilendersadi = "";
  double sonort = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              Sabitler.baslik,
              style: Sabitler.baslikstyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildform(),
                ),
                Expanded(
                  child: OrtalamaGoster(
                    ders_sayisi: DataHelper.tumdersler.length,
                    ortalama: DataHelper.NotOrtalama(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(
                height: 3,
                width: 1,
                child: Container(
                  decoration: BoxDecoration(color: Sabitler.anarenk),
                )),
            Expanded(
              child: DersListesi(
                onDismiss: (index) {
                  DataHelper.tumdersler.removeAt(index);
                  setState(() {});
                },
              ),
            ),
          ],
        ));
  }

  Widget _buildform() {
    return Form(
      key: formkey,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: textformfieldyapim()),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 12, right: 8),
                  child: Harf_Dropdown(
                    onharfsecildi: (harf) {
                      secilendeger = harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Sayilar_Dropdown(onsayisecildi: (gelen) {
                    firstnumber = gelen;
                  }),
                ),
              ),
              IconButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      var eklenecekders = Ders(
                          ad: girilendersadi,
                          harfdeger: secilendeger,
                          kredideger: firstnumber);

                      DataHelper.Dersekle(eklenecekders);

                      //sonort=DataHelper.NotOrtalama();
                    }
                    ;
                  },
                  icon: Icon(
                    Icons.arrow_circle_right,
                    color: Sabitler.anarenk.shade400,
                    size: 30,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  TextFormField textformfieldyapim() {
    return TextFormField(keyboardType: TextInputType.url,
      decoration: InputDecoration(
          hintText: "Dersi Giriniz",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius1,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anarenk.shade100.withOpacity(0.8)),
      onSaved: (deger) {
        setState(() {
          girilendersadi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return "Ders adını giriniz";
        } else {
          return null;
        }
      },
    );
  }


}
