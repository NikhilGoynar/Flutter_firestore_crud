import 'package:flutter/material.dart';

class UpdateStudentPage extends StatefulWidget {
  const UpdateStudentPage({Key? key}) : super(key: key);

  @override
  State<UpdateStudentPage> createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {
  final _formkey = GlobalKey<FormState>();
  Update() {
    print("updated");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Student")),
      body: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
            child: ListView(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: (TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your name',
                        labelText: 'Name',
                      ),
                      initialValue: 'Rahul',
                      onChanged: (value) => {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Your Name';
                        } else {
                          return null;
                        }
                      },
                    ))),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: (TextFormField(
                      onChanged: (value) => {},
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Email',
                        labelText: 'Email',
                      ),
                      initialValue: 'rahul@gs.com',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Your Email';
                        } else if (!value.contains('@')) {
                          return "Please Enter Valid Email";
                        }
                        return null;
                      },
                    ))),
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    child: (TextFormField(
                      onChanged: (value) => {},
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Password',
                        labelText: 'Password',
                      ),
                      initialValue: 'Nikhil',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Your Password';
                        } else {
                          return null;
                        }
                      },
                    ))),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 30))),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Update();
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
