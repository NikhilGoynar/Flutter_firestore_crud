import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({Key? key}) : super(key: key);

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  var name;
  var Email;
  var Password;
  addUser() {
    name = nameController.text;
     Email = EmailController.text;
      Password = PasswordController.text;
      Map<String,dynamic>m={
        "name":name,
        "Email":Email,
        "Password":Password
      };
      FirebaseFirestore.instance.collection("student").doc().set(m);
  }
  clearText() {
    nameController.clear();
    EmailController.clear();
    PasswordController.clear();
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
                      controller: nameController,
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Email',
                        labelText: 'Email',
                      ),
                      controller: EmailController,
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
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Password',
                        labelText: 'Password',
                      ),
                      controller: PasswordController,
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
                        
                        addUser();
                        clearText();
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
