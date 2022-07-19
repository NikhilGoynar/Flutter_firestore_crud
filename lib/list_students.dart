// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_crud/udate_student.dart';

class ListStudentPage extends StatefulWidget {
  const ListStudentPage({Key? key}) : super(key: key);

  @override
  State<ListStudentPage> createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
  final CollectionReference students =
      FirebaseFirestore.instance.collection('student');
 // return FutureBuilder<QuerySnapshot>(
    //     future: fetchData(),
    //     builder: (ctx, snapshot) {
    //       // Checking if future is resolved
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         // If we got an error
    //         if (snapshot.hasError) {
    //           return Center(
    //             child: Text(
    //               '${snapshot.error} occurred',
    //               style: TextStyle(fontSize: 18),
    //             ),
    //           );

    //           // if we got our data
    //         } else if (snapshot.hasData) {
    //           return Column(
    //             children: [
    //               for (var doc in snapshot.data!.docs) ...[
    //                 Text("data is ${doc['email']}")
    //               ]
    //             ],
    //           );
    //         }
    //       }
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     });
  @override
  Widget build(BuildContext context) {
   
    return StreamBuilder<QuerySnapshot>(
        stream: students.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> Snapshot) {
          if(Snapshot.connectionState==ConnectionState.active){
          if (Snapshot.hasData) {
            return ListView.builder(
                itemCount: Snapshot.data!.docs.length,
                itemBuilder: (context, i) {
                 
                      
                      Map<String,dynamic>userMap=Snapshot.data!.docs[i].data() as Map<String,dynamic>;
                      
                  return Container(
                    child: Text("Email is ${userMap["Email"]}"),
                  );
                });
          } else if (Snapshot.hasError) {}}
          
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
        // stream: studentsStream,
        // builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //   if (snapshot.hasError) {
        //     print('Something went Wrong');
        //   } else if (snapshot.connectionState == ConnectionState.waiting) {
        //     print("Pending ji");
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   }
        //   final List storedocs = [];
        //   snapshot.data!.docs.map((DocumentSnapshot document) {
        //     Map a = document.data() as Map<String, dynamic>;
        //     storedocs.add(a);
        //   }).toList();});
  


// class ListStudentPage extends StatefulWidget {
//   const ListStudentPage({Key? key}) : super(key: key);

//   @override
//   State<ListStudentPage> createState() => _ListStudentPageState();
// }

// class _ListStudentPageState extends State<ListStudentPage> {
//   final CollectionReference _students =
//       FirebaseFirestore.instance.collection('student');
//   delete(String s) async {
//     FirebaseFirestore.instance.collection('student').doc('s').delete();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Builder(builder: (context) {
//       return Column(children: [
//         Padding(
//           padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 4.0),
//           child: Table(
//               border: TableBorder.all(),
//               columnWidths: const <int, TableColumnWidth>{
//                 1: FixedColumnWidth(140),
//               },
//               defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//               children: [
//                 TableRow(children: [
//                   TableCell(
//                     child: Container(
//                       color: Colors.grey,
//                       child: Text(
//                         "Name",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   TableCell(
//                     child: Container(
//                       color: Colors.grey,
//                       child: Text(
//                         "Email",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   TableCell(
//                     child: Container(
//                       color: Colors.grey,
//                       child: Text(
//                         "Action",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ])
//               ]),
//         ),
//         Flexible(
//           child: StreamBuilder(
//               stream: _students.snapshots(),
//               builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//                 if (streamSnapshot.hasData) {
//                   return ListView.builder(
//                       itemCount: streamSnapshot.data!.docs.length,
//                       itemBuilder: (context, i) {
//                         final DocumentSnapshot documentSnapshot =
//                             streamSnapshot.data!.docs[i];
//                         return SingleChildScrollView(
//                             scrollDirection: Axis.vertical,
//                             child: Table(
//                               border: TableBorder.all(),
//                               columnWidths: const <int, TableColumnWidth>{
//                                 1: FixedColumnWidth(140),
//                               },
//                               defaultVerticalAlignment:
//                                   TableCellVerticalAlignment.middle,
//                               children: [
//                                 TableRow(children: [
//                                   TableCell(
//                                     child: Container(
//                                       padding: EdgeInsets.symmetric(
//                                           vertical: 10.0, horizontal: 10.0),
//                                       child: Text(documentSnapshot['name']),
//                                     ),
//                                   ),
//                                   TableCell(
//                                     child: Container(
//                                       padding: EdgeInsets.symmetric(
//                                           vertical: 10.0, horizontal: 10.0),
//                                       child: Text(documentSnapshot['email']),
//                                     ),
//                                   ),
//                                   TableCell(
//                                     child: Container(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           IconButton(
//                                               onPressed: () {
//                                                 Navigator.of(context)
//                                                     .push(MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       UpdateStudentPage(),
//                                                 ));
//                                               },
//                                               icon: Icon(Icons.edit)),
//                                           IconButton(
//                                               onPressed: () {
//                                                 delete(documentSnapshot.id);
//                                               },
//                                               icon: Icon(Icons.delete))
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ])
//                               ],
//                             ));
//                       });
//                 }
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }),
//         ),
//       ]);
//     });
//   }
// }
    //  StreamBuilder<QuerySnapshot>(
    //     stream: studentsStream,
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasError) {
    //         print('Something went Wrong');
    //       } else if (snapshot.connectionState == ConnectionState.waiting) {
    //         print("Pending ji");
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       final List storedocs = [];
    //       snapshot.data!.docs.map((DocumentSnapshot document) {
    //         Map a = document.data() as Map<String, dynamic>;
    //         storedocs.add(a);
    //       }).toList();
           