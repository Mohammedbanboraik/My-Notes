// ignore_for_file: avoid_unnecessary_containers, avoid_print, use_build_context_synchronously, unnecessary_this, avoid_types_as_parameter_names, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notapp/editnotes.dart';
import 'package:notapp/local/localcontroller.dart';
import 'package:notapp/sqldb.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Sqldb sqldb = Sqldb();

  List notes = [];
  bool isLoading = true;

  Future readData() async {
    List<Map> response = await sqldb.readData("SELECT * FROM notes ");

    notes.addAll(response);
    isLoading = false;

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Localcontroller controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "home_page".tr, // ✅ مترجم
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              controller.changelang(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "en",
                child: Text("English".tr), // ✅ مترجم
              ),
              PopupMenuItem(
                value: "ar",
                child: Text("Arabic".tr), // ✅ مترجم
              ),
            ],
            icon: const Icon(Icons.language, color: Colors.white),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).pushNamed("addnotes");
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : notes
                .isEmpty // ✅ إضافة رسالة عند عدم وجود ملاحظات
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.note_add, size: 80, color: Colors.blue[400]),
                  const SizedBox(height: 16),
                  Text(
                    "no_notes".tr, // ✅ مترجم
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          : ListView(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: notes.length,
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        title: Text(
                          "${notes[i]['title']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          "${notes[i]['note']}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                Get.defaultDialog(
                                  buttonColor: Colors.blue,
                                  cancelTextColor: Colors.blue,
                                  title: "warning".tr, // ✅ مترجم
                                  middleText:
                                      "delete_confirmation".tr, // ✅ مترجم
                                  titleStyle: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  middleTextStyle: const TextStyle(
                                    letterSpacing: 1,
                                  ),
                                  textConfirm: "confirm".tr, // ✅ مترجم
                                  textCancel: "cancel".tr, // ✅ مترجم
                                  onConfirm: () async {
                                    Get.back();
                                    int response = await sqldb.deleteData(
                                      "DELETE FROM notes WHERE id = ${notes[i]['id']}",
                                    );

                                    if (response > 0) {
                                      notes.removeWhere(
                                        (Element) =>
                                            Element['id'] == notes[i]['id'],
                                      );
                                      Get.snackbar(
                                        icon: Icon(
                                          Icons.done,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        "success".tr, // ✅ مترجم
                                        "note_deleted".tr, // ✅ مترجم
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.blue,
                                        colorText: Colors.white,
                                        duration: const Duration(seconds: 3),
                                      );
                                      setState(() {});
                                    }
                                  },
                                  onCancel: () {},
                                );
                              },
                              icon: const Icon(Icons.delete, color: Colors.red),
                              tooltip: "delete".tr, // ✅ مترجم
                            ),
                            IconButton(
                              onPressed: () async {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EditNotes(
                                      note: notes[i]['note'],
                                      title: notes[i]['title'],
                                      id: notes[i]['id'],
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              tooltip: "edit".tr, // ✅ مترجم
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
