import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String _locationMessage = "";

//? Koordinat değerlerini çekmek için fonksiyon
  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    //? Koordinat değerlerini terminal üzerinden kontrol et
    //print(position);

    //? Koordinat değerlerinin nasıl yazılacağını belirle
    setState(() {
      _locationMessage =
          "Enlem: ${position.latitude.toStringAsFixed(7)} && Boylam: ${position.longitude.toStringAsFixed(7)}";
      //? .toStringAsFixed(7) virgülden sonra basamak kontrolü için
    });

    //! Sürekli olarak koordinat değeri döndürmek için
    return _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text("WGS 84 Koordinat")),
        body: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_locationMessage),
              //? Koordinat öğren talimatını veren buton
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  //? Koordinat öğrenmek için oluşturulmuş fonksiyonun aktif edilmesi
                  _getCurrentLocation();
                },
                color: Colors.green,
                child: const Text("Konum Bul"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
