import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_mge/nmr2/nomer2.dart';
import 'package:test_mge/nmr2/nomer3.dart';

class TestDua extends StatefulWidget {
  const TestDua({Key? key}) : super(key: key);

  @override
  State<TestDua> createState() => _TestDuaState();
}

class _TestDuaState extends State<TestDua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return JawabanNomer2();
                }));
              },
              child: Text("Nomer 2")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return JawabanNomer3();
                }));
              },
              child: Text("Nomer 3"))
        ],
      ),
    );
  }
}
