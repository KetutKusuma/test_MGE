import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_mge/nmr2/nomer3.dart';

class DetailProduct extends StatelessWidget {
  final Mama mama;
  DetailProduct({Key? key, required this.mama}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("detail Product"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(mama.thumbnailUrl + ".png"),
              Text("ID : " + mama.id.toInt().toString()),
              Text("TITLE : " + mama.title),
              Text("URL : " + mama.url)
            ],
          ),
        ),
      ),
    );
  }
}
