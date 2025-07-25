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
  TextEditingController namecontroller = TextEditingController();
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
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Student Data"),
                content: Column(
                  children: [
                    TextFormField(
                      controller: namecontroller,

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
                      controller: emailcontroller,

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
                          Username: namecontroller.text,
                          Email: emailcontroller.text,
                          phonenumber: phonenumbercontroller.text,
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
    body: StreamBuilder(stream: fetchstudents(), builder: (context, snapshot) {
      if(!snapshot.hasData){return Center(child:CircularProgressIndicator(),);}
    final studentdata=snapshot.data!.docs;
    return ListView.builder(
      itemCount: studentdata.length,
      itemBuilder:(context, Index) {return ListTile(title: Text(studentdata[Index]['Username']),subtitle: Text(studentdata[Index]['phonenumber']),);
    },);
    }
    ));
  }
}

    