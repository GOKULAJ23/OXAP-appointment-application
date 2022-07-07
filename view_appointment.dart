import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:medbooking/layout/login.dart';

class vapp extends StatefulWidget {
  const vapp({Key? key}) : super(key: key);

  @override
  State<vapp> createState() => _vappState();
  static var ld;
}

class _vappState extends State<vapp> {

  late List data;
  var len=0;
  void List_function() async {
    var url = Uri.parse(login.ip+"appointment/android/");
    Response resp1 = await get(url);

    setState(() {
      data = jsonDecode(resp1.body);
      len=data.length;
    });
    print(resp1.body);
  }
  @override
  Widget build(BuildContext context) {
    List_function();
    return Scaffold(
      // drawer: draw(),
      appBar: AppBar(
        // backgroundColor: Colors.pinkAccent.shade200,
        title: Text(
          "View Appointment",
          style: new TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: new ListView.builder(
          itemCount: len,
          itemBuilder: (BuildContext context, int index) {
            return new Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: new Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:<Widget> [
                      new SizedBox(
                        height: 20,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          new Text('Doctor: '+data[index]['d_id']),

                        ],
                      ),
                      new SizedBox(
                        height:20,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          new Text('Patient: '+data[index]['p_id']),

                        ],
                      ),
                      new SizedBox(
                        height:20,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          new Text('date: '+data[index]['date']),

                        ],
                      ),
                      new SizedBox(
                        height:20,
                      ),

                    ],

                  ),
                )
            );
          },
        ),
      ),
    );
  }
}
