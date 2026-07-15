// ignore_for_file: avoid_unnecessary_containers, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notapp/home.dart';
import 'package:notapp/sqldb.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  Sqldb sqldb = Sqldb();

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "add_page".tr,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),

      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
              key: formState,
              child: Column(
                children: [
                  TextFormField(
                    controller: note,
                    decoration: InputDecoration(
                      hintText: "note".tr,
                    ),
                  ),

                  TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                      hintText: "title".tr,
                    ),
                  ),

                  const SizedBox(height: 20),

                  MaterialButton(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    color: Colors.blue,
                    textColor: Colors.white,

                    onPressed: () async {
                      int response = await sqldb.insertData('''
                       INSERT INTO notes ( note , title )
                       VALUES ("${note.text}" , "${title.text}" )
                       ''');

                      if (response > 0) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                          (route) => false,
                        );
                      }
                    },

                    child: Text(
                      "add_note".tr,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}