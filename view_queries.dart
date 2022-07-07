// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:medicine_boxx/layout/login.dart';
// import 'package:medicine_boxx/layout/post__query.dart';
// import 'dart:convert';
//
// import 'package:medicine_boxx/layout/reply_query.dart';
//
// class view_queries extends StatefulWidget {
//   const view_queries({Key? key}) : super(key: key);
//   static var qid;
//   @override
//   _view_queriesState createState() => _view_queriesState();
// }
//
// class _view_queriesState extends State<view_queries> {
//   late List data;
//   var uid = login.uid;
//
//   void viw() async {
//     Response resp = await post(login.ip+"/queries/viewquery/",
//         body: {"uid": uid.toString()});
//     setState(() {
//       data = jsonDecode(resp.body);
//     });
//   }
//
//   @override
//   void initState() {
//     viw();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "VIEW QUERIES",
//           style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//         child: ListView.builder(
//             itemCount: data != null ? data.length : 0,
//             itemBuilder: (context, index) {
//               return new Padding(
//                 padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
//                 child: Card(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("date:" + data[index]['date'].toString()),
//                       Text("time :" + data[index]['time'].toString()),
//                       Text("query :" + data[index]['queries'].toString()),
//                       Container(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             print(data[index]['q_id']);
//                             view_queries.qid = data[index]['q_id'];
//
//                             Navigator.of(context).pop();
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (_) => reply_query()));
//                           },
//                           child: Text("REPLY"),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }
