import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widget/Convert.dart';
import 'widget/Input.dart';
import 'widget/Result.dart';
import 'widget/Riwayat.dart';
import 'widget/DropdownKonversi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0; //inisialisasi
  final inputController = TextEditingController(); // memanggil nilai variabel
  String _newValue = "Kelvin"; //inisialisasi
  double _result = 0;
  List<String> listViewItem = List<String>();
  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else
        _result = (4 / 5) * _inputUser;
    });
    listViewItem.add("$_newValue : $_result"); //menampilkan hasil
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      perhitunganSuhu();
    });
  }

  var listItem = ["Kelvin", "Reamur"]; //data nilai

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(inputUserController: inputController),
              dropdownKonversi(
                  listItem: listItem,
                  newValue: _newValue,
                  dropdownOnChanged: dropdownOnChanged),
              Result(result: _result),
              Convert(
                konvertHandler: perhitunganSuhu,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                //memenuhi ruang kosong
                child: Riwayat(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
