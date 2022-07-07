
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:medbooking/layout/login.dart';

class registerdoctor extends StatefulWidget {
  const registerdoctor({Key? key}) : super(key: key);

  @override
  State<registerdoctor> createState() => _registerdoctorState();
}

class _registerdoctorState extends State<registerdoctor> {
  List dropList = [
    {"d_id": 0, "department": "<One>"}
  ];
  List listItems = ['SELECT'];
  var dropdownValue = "";
  late TextEditingController fnm,qual,phone,usnm,paswd;
  void gendrop() async {
    var url = login.ip+"department/android/";
    var resp = await get(url);
    setState(() {
      dropList = jsonDecode(resp.body);
      print(dropList);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    usnm=TextEditingController();
    phone=TextEditingController();
    fnm=TextEditingController();
    qual=TextEditingController();

    paswd=TextEditingController();


    super.initState();
    gendrop();
  }
  void addto() async{
    var url=Uri.parse(login.ip+"doctor/android/");
    void res=await post(url,body: {
      "doctor":fnm.text,
      "qualification":qual.text,
      "department": dropdownValue.toString(),
      "mobile":phone.text,
      "username":usnm.text,
      "password":paswd.text

    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Successful...")));

    Navigator.push(
        context, MaterialPageRoute(builder: (_) => login()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Text("Register",style: new TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),

                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                  child: TextFormField(
                    controller: fnm,
                    decoration: InputDecoration(
                        labelText: 'Enter Name',
                        hintText: "Enter Name",
                        prefixIcon: Icon(Icons.people),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )


                    ),


                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20), //3rd
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: DropdownButtonFormField(
                      hint: Text("<select Center>"),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue= newValue.toString();
                          print(newValue.toString());
                        });
                      },
                      items: dropList
                          .map((item) => DropdownMenuItem(
                        child: Text(item['department']),
                        value: item['department'].toString(),
                      ))
                          .toList()),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                  child: TextFormField(
                    controller: qual,
                    decoration: InputDecoration(
                        labelText: 'Enter Qualification',
                        hintText: "Enter Qualification",
                        prefixIcon: Icon(Icons.photo_album),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )


                    ),


                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                  child: TextFormField(
                    controller: phone,
                    decoration: InputDecoration(
                        labelText: 'Phone',
                        hintText: "Enter Phone number",
                        prefixIcon: Icon(Icons.mobile_screen_share),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )


                    ),


                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                  child: TextFormField(
                    controller: usnm,
                    decoration: InputDecoration(
                        labelText: 'username',
                        hintText: "Enter Username",
                        prefixIcon: Icon(Icons.people),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )


                    ),


                  ),
                ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                //   child: TextFormField(
                //     controller: name,
                //     decoration: InputDecoration(
                //         labelText: 'Username',
                //         hintText: "Enter Your Username",
                //         prefixIcon: Icon(Icons.account_box_rounded),
                //
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20)
                //         )
                //
                //
                //     ),
                //
                //
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                  child: TextFormField(
                    controller: paswd,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: "Enter Your Password",
                        prefixIcon: Icon(Icons.remove_red_eye),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )


                    ),


                  ),
                ),
                Container(
                  // width: 90,
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                  child: ElevatedButton
                    (onPressed: () {
                    addto();
                  },
                    child: Text("Register"),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
