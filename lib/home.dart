import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:student_directrory_app/services.dart';

class Homee extends StatefulWidget {
  const Homee({super.key});

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  @override
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 132, 207),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          "Student directory",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 226, 132, 207),
        foregroundColor: const Color.fromARGB(228, 0, 0, 0),
        onPressed: () {
          emailcontroller.clear();
          usernamecontroller.clear();
          phonenumbercontroller.clear();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Student Data"),
                content: Column(
                  children: [
                    TextFormField(
                      controller: emailcontroller,

                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(185, 142, 157, 164),
                        filled: true,
                        label: Text(
                          "Email",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: usernamecontroller,

                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(185, 142, 157, 164),
                        filled: true,
                        label: Text(
                          "Username",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: phonenumbercontroller,

                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(185, 142, 157, 164),
                        filled: true,
                        label: Text(
                          "Phone Number",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        addstudent(
                          Username: usernamecontroller.text,
                          Email: emailcontroller.text,
                          Phonenumber: phonenumbercontroller.text,
                          context: context,
                        );
                      },
                      child: Text("Add student data"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add_rounded),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fetchstudents(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final studentdata = snapshot.data!.docs;

          return ListView.builder(
            itemCount: studentdata.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        usernamecontroller.text =
                            studentdata[index]["Username"];
                        emailcontroller.text = studentdata[index]["Email"];
                        phonenumbercontroller.text =
                            studentdata[index]["Phonenumber"];
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              children: [
                                TextFormField(
                                  controller: phonenumbercontroller,

                                  decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                      185,
                                      142,
                                      157,
                                      164,
                                    ),
                                    filled: true,
                                    label: Text(
                                      "Phone Number",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: usernamecontroller,

                                  decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                      185,
                                      142,
                                      157,
                                      164,
                                    ),
                                    filled: true,
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    update(
                                      studentdata[index].id,
                                      usernamecontroller.text,
                                      emailcontroller.text,
                                      phonenumbercontroller.text,
                                      context,
                                    );
                                  },
                                  child: Text("Add student data"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                    foregroundColor: Colors.black,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        deletestudent(studentdata[index].id, context);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
                title: Text(studentdata[index]["Username"]),
                subtitle: Text(studentdata[index]["Phonenumber"]),
              );
            },
          );
        },
      ),
    );
  }
}
