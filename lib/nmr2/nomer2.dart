import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class JawabanNomer2 extends StatefulWidget {
  const JawabanNomer2({Key? key}) : super(key: key);

  @override
  State<JawabanNomer2> createState() => _JawabanNomer2State();
}

String url = "https://jsonplaceholder.typicode.com/albums/1/photos";
Future<List<User>> getProducts() async {
  var response = await http.get(Uri.parse(url));

  var json = jsonDecode(response.body);

  List<User> userList = [];

  for (var u in json) {
    User user = User(
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

class _JawabanNomer2State extends State<JawabanNomer2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("jawaban nomer 2 test2"),
      ),
      body: FutureBuilder<List<User>>(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (contex, index) {
                    return Card(
                      child: Container(
                        height: 200,
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
                                      height: 150,
                                      width: 150,
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

class User {
  int albumId;
  int id;
  String title;
  String url;

  String thumbnailUrl;

  User(
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  );
}
