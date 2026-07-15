// ignore_for_file: avoid_unnecessary_containers, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notapp/home.dart';
import 'package:notapp/sqldb.dart';

class EditNotes extends StatefulWidget {
  final String note;
  final String title;
  final int id;

  const EditNotes({
    super.key,
    required this.note,
    required this.title,
    required this.id,
  });

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  Sqldb sqldb = Sqldb();

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();

  @override
  void initState() {
    note.text = widget.note;
    title.text = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "edit_page".tr,
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

                      int response = await sqldb.updateData('''
                          UPDATE notes SET
                          note  = "${note.text}",
                          title = "${title.text}"
                          WHERE id = ${widget.id}
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
                      "edit_note".tr,
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