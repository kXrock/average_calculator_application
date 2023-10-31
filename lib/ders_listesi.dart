// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama_application/constants/app_constant.dart';
import 'package:ortalama_hesaplama_application/data.dart';
import 'package:ortalama_hesaplama_application/model/ders.dart';

class name extends StatelessWidget {
  const name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumderslerlast = DataHelper.tumdersler;
    return tumderslerlast.length > 0
        ? ListView.builder(
            itemCount: tumderslerlast.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDismiss(index);
                },
                child: Card(
                  child: ListTile(
                    title: Text(tumderslerlast[index].ad),
                    leading: CircleAvatar(
                      backgroundColor: Sabitler.anarenk,
                      child: Icon(Icons.favorite_border),
                    ),
                    subtitle: Text(
                        "${tumderslerlast[index].kredideger} Kredi , Not Değeri:${tumderslerlast[index].harfdeger}"),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Container(
              child: Text(
                "Lütfen Ders Giriniz",
                style: Sabitler.baslikstyle,
              ),
            ),
          );
  }
}
