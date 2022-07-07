import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:medbooking/layout/login.dart';

class querypost extends StatefulWidget {
  const querypost({Key? key}) : super(key: key);

  @override
  State<querypost> createState() => _querypostState();
}

class _querypostState extends State<querypost> {
  // late TextEditingController cm;
  @override


  late List data;
  var len=1;

  void view()async{
    Response resp =await get(
        login.ip+"message/android/"

    );
    setState(() {
      data=jsonDecode(resp.body);
    });
  }
  late TextEditingController com;
  @override
  void initState() {
    com=TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  void addto() async{
    var url=Uri.parse(login.ip+"message/android/");
    void res=await post(url,body: {
      "message":com.text,
      'u_id':login.uid

    });

  }
  @override
  Widget build(BuildContext context) {
    view();
    return Scaffold(
      // drawer: draw(),
      appBar: AppBar(
        // backgroundColor: Colors.pinkAccent.shade200,
        title: Text(
          "Messages",
          style: new TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
            child: TextFormField(
              controller: com,

              decoration: InputDecoration(

                  labelText: 'Message',
                  hintText: "Enter Message",
                  prefixIcon: Icon(Icons.message_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
            ),
          ),
          Container(
            width: 90,

            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ElevatedButton
              (onPressed: () {
              addto();
            },
              child: Text("Post"),

            ),
          ),

          Expanded(
              child: new ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (context, index) {
                  return new Padding(
                    padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
                    child: new Card(
                      elevation: 2.0,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(16.0)
                      ),
                      child: InkWell(
                        onTap: () {

                          print("tapped");
                          //  tap funtion here
                        },
                        child: new Column(
                          children: <Widget>[
                            new Padding(
                              padding: new EdgeInsets.all(16.0),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Text('Messsae : '+data[index]['message'].toUpperCase(), style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleMedium,
                                  ), new Text('REPLY : '+(data[index]['reply']).toString().toUpperCase(), style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleMedium,
                                  ),
                                  new SizedBox(height: 6.0),
                                  new Text('DATE : '+data[index]['date'], style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleMedium,
                                  ),




                                  new SizedBox(height: 6.0),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
          ),
        ],
      ),
    );
  }
}
