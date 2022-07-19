import 'package:flutter/material.dart';

import 'add_students.dart';
import 'list_students.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Flutter Firebase CRUD"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddStudentPage(),
                ));
              },
              child: Text(
                "Add",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
      body: ListStudentPage(),
    );
  }
}
