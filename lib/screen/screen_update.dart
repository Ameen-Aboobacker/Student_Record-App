import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_sample/db/functions/db_functions.dart';
import 'package:hive_sample/db/models/data_model.dart';
import 'package:hive_sample/screen/screen_list.dart';

// ignore: must_be_immutable
class ScreenUpdate extends StatefulWidget {
  ScreenUpdate({
    super.key,
    required this.data,
    required this.index,
  });
  final StudentModel data;
  int index;

  @override
  State<ScreenUpdate> createState() => _ScreenUpdateState();
}

class _ScreenUpdateState extends State<ScreenUpdate> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final placeController = TextEditingController();
  final numbController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    nameController.text = widget.data.name;
    ageController.text = widget.data.age;
    placeController.text = widget.data.place;
    numbController.text = widget.data.number;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        appBar: AppBar(
        centerTitle: true,
        elevation: 3,
        title:Text('Update Student Details') ,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:const Icon(Icons.arrow_back),
        ),
        leadingWidth: 56,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                     prefixIcon: Icon(Icons.person),
                      label: Text('Name'),
                      hintText: ("Student Name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student name is empty';
                    }
                    return null;
                  },
                ),
               const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(
                     prefixIcon: Icon(Icons.calendar_view_day),
                      label: Text('Age'),
                      hintText: ("Student Age"),
                      border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10))
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student age is empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: placeController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.place ),
                      hintText: ("Enter Place"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student place is empty';
                    }
                    return null;
                  },
                ),
               const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: numbController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                      label: Text('Phone Number'),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student admission number is empty';
                    }
                    return null;
                  },
                ),
              const  SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      updateStudentFunction();
                    },
                    child:const Text(
                      'Update',
                    ))
              ],
            ),
          ),
        ));
  }

  void updateStudentFunction() {
    if (formkey.currentState!.validate()) {
      final name = nameController.text.trim();
      final age = ageController.text.trim();
      final place = placeController.text.trim();
      final number = numbController.text.trim();
      final student = StudentModel(
        name: name,
        age: age,
        place :place,
        number: number,
      );
      updateStudent(
        widget.index,
        student,
      );
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Get.snackbar(
        ' ',
        'student updated succesfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
