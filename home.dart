
import 'package:flutter/material.dart';
import 'package:medbooking/layout/patientregister.dart';
import 'package:medbooking/layout/registerdoctor.dart';

import 'login.dart';

class signup extends StatefulWidget {
  const signup({Key ? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade600,
        title: Text(
          "SIGNUP !",
          style: new TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
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
            image: AssetImage("asset/abc.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => registerdoctor()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown.shade600, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    child: Text("  DOCTOR  "),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => register()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown.shade600, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    child: Text("Patient"),
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
