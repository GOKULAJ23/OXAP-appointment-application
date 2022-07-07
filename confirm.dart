// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:medbooking/layout/appoinment.dart';
import 'package:medbooking/layout/login.dart';
import 'package:medbooking/layout/viewdoc.dart';


class confirm extends StatefulWidget {
  const confirm({Key ?key}) : super(key: key);

  @override
  _confirmState createState() => _confirmState();


}

class _confirmState extends State<confirm> {
  var fkey = GlobalKey<FormState>();
  var val = true;
  DateTime selectedDate = DateTime.now();
  late String _setDate;
  late String dateTime;
  TextEditingController da = TextEditingController();
  late TextEditingController slot;
  int _value = 1;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    da = TextEditingController();
    slot = TextEditingController();

    super.initState();
  }

  void postdata() async {
    var url = login.ip+"appointment/android/";


    void res = await post(url, body: {
      "slot": appoinment.slt,
      "date":appoinment.dt,
      "p_id": login.uid.toString(),
      "d_id": viewdoc.ld,


    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1850, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        da.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (_) => login()));
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/ae.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: Text(
                    "Confirm ",
                    style: new TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),



                Container(
                  child: ElevatedButton
                    (onPressed: () {
                    {


                      postdata();



                    }
                  },
                    child: Text("Book"),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {});
  }
}
