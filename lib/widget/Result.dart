import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Result extends StatelessWidget {
  const Result({
    Key key,
    @required double kelvin,
    @required double reamur,
  }) : _kelvin = kelvin, _reamur = reamur, super(key: key);

  final double _kelvin;
  final double _reamur;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //MASING-MASING OBJECT MENGGUNAKAN COLUMN LAGI ADA DUA BUAH TEKS YANG INGIN DITAMPILKAN SECARA VERTICAL
        Column(
          children: <Widget>[
            Text(
              "Suhu dalam Kelvin",
              // style: TextStyle(height: 2.0),
            ),
            Divider(), //jarak antar text
            Text(
              '$_kelvin', 
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              "Suhu dalam Reamor",
              // style: TextStyle(height: 2.0),
            ),
            Divider(),
            Text(
              _reamur.toStringAsFixed(2), 
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
