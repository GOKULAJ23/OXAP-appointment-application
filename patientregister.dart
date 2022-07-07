
import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:medbooking/layout/login.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  late TextEditingController nm,phn,addrs,ema,pswd;
  @override
  void initState() {
    // TODO: implement initState
    nm=TextEditingController();
    phn=TextEditingController();
    addrs=TextEditingController();
    ema=TextEditingController();
    pswd=TextEditingController();



    super.initState();
  }
  void addto() async{
    var url=Uri.parse(login.ip+"patient/android/");
    void res=await post(url,body: {
      "name":nm.text,
      "phone":phn.text,
      "address":addrs.text,
      "email":ema.text,
      "password":pswd.text

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
                    controller: nm,
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
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                  child: TextFormField(
                    controller: phn,
                    decoration: InputDecoration(
                        labelText: 'Phone',
                        hintText: "Enter Phone",
                        prefixIcon: Icon(Icons.pin_drop_rounded),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )


                    ),


                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                  child: TextFormField(
                    controller: ema,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: "Enter Email",
                        prefixIcon: Icon(Icons.people),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )


                    ),


                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                  child: TextFormField(
                    controller: addrs,
                    decoration: InputDecoration(
                        labelText: 'Address',
                        hintText: "Enter Address",
                        prefixIcon: Icon(Icons.location_city),

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
                    controller: pswd,
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
