import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:test_mge/nmr2/detail_produk.dart';

class JawabanNomer3 extends StatefulWidget {
  const JawabanNomer3({Key? key}) : super(key: key);

  @override
  State<JawabanNomer3> createState() => _JawabanNomer2State();
}

String url = "https://jsonplaceholder.typicode.com/photos/?id=1";
Future<List<Mama>> getProducts() async {
  var response = await http.get(Uri.parse(url));

  var json = jsonDecode(response.body);

  List<Mama> userList = [];

  for (var u in json) {
    Mama user = Mama(
      u['albumId'],
      u['id'],
      u['title'],
      u['url'],
      u['thumbnailUrl'],
    );
    userList.add(user);
  }

  print(userList.length);

  return userList;
}

class _JawabanNomer2State extends State<JawabanNomer3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("jawaban nomer 2 test2"),
      ),
      body: FutureBuilder<List<Mama>>(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (contex, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => DetailProduct(
                                    mama: snapshot.data![index]))));
                      },
                      child: Card(
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(8),
                          // child: Image.network(
                          //   snapshot.data![index].thumbnailUrl,
                          //   height: 100,
                          //   width: 100,
                          // ),
                          child: Wrap(
                            direction: Axis.vertical,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        "${snapshot.data![index].thumbnailUrl}.png",
                                        height: 100,
                                        width: 100,
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          snapshot.data![index].title,
                                          overflow: TextOverflow.visible,
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
                    );
                  }),
            );
          } else
            return Text("mama");
        },
      ),
    );
  }
}

class Mama {
  int albumId;
  int id;
  String title;
  String url;

  String thumbnailUrl;

  Mama(
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  );
}
