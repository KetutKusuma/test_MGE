import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:test_mge/jawaban/test2.dart';

class TestSatuPage extends StatefulWidget {
  const TestSatuPage({Key? key}) : super(key: key);

  @override
  State<TestSatuPage> createState() => _TestSatuPageState();
}

class _TestSatuPageState extends State<TestSatuPage> {
  @override
  var formatter = NumberFormat.decimalPattern();

  double mama = 77777;
  String newFormat = "";

  String nama = "ketut";
  String newNama = "Morning Glory Enterprise Developer";
  String newJawaban = "";
  String newJawaban2 = "";

  String changeKota3 = "";

  List<String> kota = [
    "Surabaya",
    "Jakarta",
    "Semarang",
    "Makasar",
  ];
  List<String> newKota = [];

  Vehicle v = Vehicle();
  String namaV = "";
  String kapasitasMesin = "";
  String roda = "";
  String namanewV = "";

  Car car1 = Car("ketut", "2020", "roda galak", "vario", "1234", "2022");
  Car car2 = Car("mama", "2222", "roda apek", "sonia", "3030", "2020");

  String nCar1 = "";
  String kCar1 = "";
  String rCar1 = "";
  String mCar1 = "";
  String noCar1 = "";
  String tCar1 = "";
  String nCar2 = "";
  String kCar2 = "";
  String rCar2 = "";
  String mCar2 = "";
  String noCar2 = "";
  String tCar2 = "";

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Test 1"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 10,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("1"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(mama.toString()),
                            ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  newFormat = formatter.format(mama);
                                });
                              },
                              child: Text("format separator"),
                            ),
                            Text("jawaban : $newFormat")
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 10,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("2"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(nama),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          setState(() {
                                            newJawaban = "$nama  $newNama";
                                            newJawaban2 =
                                                newJawaban.replaceAll("o", "A");
                                          });

                                          // newValue =
                                          //     double.parse(newFormat.replaceAll(",", ""));

                                          // setState(() {
                                          //   double mama = newValue;
                                          // });
                                        },
                                        child: Text("Gabung dan ubah"),
                                      ),
                                      Text(
                                        "jawaban a: $newJawaban",
                                        overflow: TextOverflow.visible,
                                      ),
                                      Text("jawaban b: $newJawaban2"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child: Card(
                    child: Column(
                      children: [
                        Text("3"),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: kota.length,
                            itemBuilder: (context, index) {
                              return Text(kota[index]);
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              var newBroh = kota[2] = "samarinda";
                              newKota = kota;
                              kota.add("Aceh");
                            });
                          },
                          child: Text("Ubah semarang + Tambah Aceh"),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: kota.length,
                            itemBuilder: (context, index) {
                              return Text(kota[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 10,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("4"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                // setState(() {
                                //   newFormat = formatter.format(mama);
                                // });
                                print(v.kapasitasMesin);
                                setState(() {
                                  namaV = v.nama;
                                  kapasitasMesin = v.kapasitasMesin;
                                  roda = v.roda;
                                });
                              },
                              child: Text("Print vehicle"),
                            ),
                            Text("jawaban nama V: $namaV"),
                            Text("jawaban kapasitas mesin V: $kapasitasMesin"),
                            Text("jawaban roda V: $roda"),
                            ElevatedButton(
                                onPressed: () {
                                  namanewV = v.nama.toUpperCase();
                                  kapasitasMesin =
                                      v.kapasitasMesin.toUpperCase();
                                  roda = v.roda.toUpperCase();
                                },
                                child: Text("ubah jadi gede")),
                            Text("jawaban nama V: $namanewV"),
                            Text("jawaban kapasitas mesin V: $kapasitasMesin"),
                            Text("jawaban roda V: $roda"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 10,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("4"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                // setState(() {
                                //   newFormat = formatter.format(mama);
                                // });
                                print(v.kapasitasMesin);
                                setState(() {
                                  namaV = v.nama;
                                  kapasitasMesin = v.kapasitasMesin;
                                  roda = v.roda;
                                });
                              },
                              child: Text("Print vehicle"),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text("${car1.nama}"),
                                    Text("${car1.kapasitasMesin}"),
                                    Text("${car1.merek}"),
                                    Text("${car1.roda}"),
                                    Text("${car1.tahun_pembuatan}"),
                                    Text("${car1.tahun_pembuatan}"),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text("${car2.nama}"),
                                    Text("${car2.kapasitasMesin}"),
                                    Text("${car2.merek}"),
                                    Text("${car2.roda}"),
                                    Text("${car2.tahun_pembuatan}"),
                                    Text("${car2.tahun_pembuatan}"),
                                  ],
                                ),
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    nCar1 = car1.nama.toString().toUpperCase();
                                    kCar1 = car1.kapasitasMesin
                                        .toString()
                                        .toUpperCase();
                                    rCar1 = car1.roda.toString().toUpperCase();
                                    mCar1 = car1.merek.toString().toUpperCase();
                                    tCar1 = car1.tahun_pembuatan
                                        .toString()
                                        .toUpperCase();
                                    noCar1 = car1.nomor_rangka
                                        .toString()
                                        .toUpperCase();

                                    nCar2 = car2.nama.toString().toUpperCase();
                                    kCar2 = car2.kapasitasMesin
                                        .toString()
                                        .toUpperCase();
                                    rCar2 = car2.roda.toString().toUpperCase();
                                    mCar2 = car2.merek.toString().toUpperCase();
                                    tCar2 = car2.tahun_pembuatan
                                        .toString()
                                        .toUpperCase();
                                    noCar2 = car2.nomor_rangka
                                        .toString()
                                        .toUpperCase();
                                  });
                                },
                                child: Text("ubah jadi gede")),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text("$nCar1"),
                                    Text("$kCar1"),
                                    Text("$rCar1"),
                                    Text("$mCar1"),
                                    Text("$tCar1"),
                                    Text("$noCar1"),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text("$nCar2"),
                                    Text("$kCar2"),
                                    Text("$rCar2"),
                                    Text("$mCar2"),
                                    Text("$tCar2"),
                                    Text("$noCar2"),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => TestDua())));
                    },
                    child: Text("Route to Test 2"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build2(BuildContext context) {
  //   List<String> kota = [
  //     "Surabaya",
  //     "Jakarta",
  //     "Semarang",
  //     "Makasar",
  //   ];
  //   return Container(
  //     child: ListView.builder(
  //       itemBuilder: (context, index) {
  //         return Card(
  //           child: Padding(
  //             padding: const EdgeInsets.all(15.0),
  //             child: Text(kota[index], style: TextStyle(fontSize: 30)),
  //           ),
  //         );
  //       },
  //       itemCount: kota.length,
  //     ),
  //   );
  // }
}

class Vehicle {
  var nama = "ketut";
  var kapasitasMesin = "2020";
  var roda = "15";

  void prinT() {
    print(nama);
    print(kapasitasMesin);
    print(roda);
  }
}

// ignore: empty_constructor_bodies
class Car {
  var nama;
  var kapasitasMesin;
  var roda;
  var merek;
  var tahun_pembuatan;
  var nomor_rangka;

  Car(this.nama, this.kapasitasMesin, this.roda, this.merek, this.nomor_rangka,
      this.tahun_pembuatan);
}
