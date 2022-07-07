// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:medbooking/layout/confirm.dart';
import 'package:medbooking/layout/login.dart';
import 'package:medbooking/layout/viewdoc.dart';


class appoinment extends StatefulWidget {
  const appoinment({Key ?key}) : super(key: key);

  @override
  _appoinmentState createState() => _appoinmentState();
  static var dt;
  static var slt;

}

class _appoinmentState extends State<appoinment> {
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
      "slot": slot.text,
      "date":da.text,
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
        title: Text("Appoinment"),
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
                    "Appoinment ",
                    style: new TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(90, 0, 90, 20),
                  child: TextFormField(
                    controller: da,

                    // enabled: false,
                    showCursor: true,
                    readOnly: true,
                    onTap: () {
                      setState(() {
                        _selectDate(context);
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'Date of booking',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 0, 90, 0), //3rd

                  width: 500.0,
                  // decoration: BoxDecoration(
                  //     // borderRadius: BorderRadius.circular(30),
                  //     border: Border.all(color: Colors.black)),

                   //1st
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 20, 90, 0),
                  child: TextFormField(
                    controller: slot,

                    decoration: InputDecoration(
                        labelText: "SLOT ",
                        hintText: "enter your slot",
                        prefixIcon: Icon(Icons.local_hospital),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),

                Container(
                  child: ElevatedButton
                    (onPressed: () {
                    {


                      appoinment.dt =da.text;
                      appoinment.slt=slot.text;


                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => confirm()));
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
