import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// class MyJsonApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final appTitle = 'Read Json Data';
//
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(appTitle),
//         ),
//         body: ReadJson(),
//       ),
//     );
//   }
// }

class ReadJson extends StatefulWidget {
  const ReadJson({Key? key}) : super(key: key);

  @override
  _ReadJsonState createState() => _ReadJsonState();
}

class _ReadJsonState extends State<ReadJson> {

  List _items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/mydata.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Read Json"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
          child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(_items[index]["fruit"]),
                        subtitle: Text('Color is : ' + _items[index]["color"]),
                      ),
                      Divider(),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
