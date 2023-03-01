import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_sample/db/functions/db_functions.dart';
import 'package:hive_sample/db/models/data_model.dart';


class ScreenInput extends StatefulWidget {
  const ScreenInput({super.key});

  @override
  State<ScreenInput> createState() => _ScreenInputState();
}

class _ScreenInputState extends State<ScreenInput> {
  final _stdnameController = TextEditingController();

  final _stdageController = TextEditingController();

  final _placeController = TextEditingController();

  final _numberController = TextEditingController();

  String imageAdd = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 148, 136, 27),
      appBar: AppBar(
        centerTitle: true,
        elevation: 3,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        leadingWidth: 56,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _stdnameController,
                  decoration: const InputDecoration(
                      label: Text('Name'),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      prefixIcon: Icon(Icons.person)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field Should be filled';
                    } else if (!RegExp(r'^[a-z A-Z]$').hasMatch(value)) {
                      return 'only Alphabets allowed';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _stdageController,
                  decoration: const InputDecoration(
                      label: Text('Age'),
                      prefixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))
                              ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field Should be filled';
                    } else if (!RegExp(r'^(\d+)$').hasMatch(value)) {
                      return 'Age should be in numbers upto 3 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  controller: _placeController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.place),
                      label: Text('Place'),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _numberController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      label: Text('Phone Number'),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      addButtonClicked(context);
                    }
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('SAVE'),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  addButtonClicked(BuildContext context)  {
    final name = _stdnameController.text.trim();
    final age = _stdageController.text.trim();
    final place = _placeController.text.trim();
    final number = _numberController.text.trim();
    if (name.isEmpty || age.isEmpty || place.isEmpty || number.isEmpty) {
      print('hai');
    } else {
      final student =
          StudentModel(name: name, age: age, place: place, number: number);
      Get.defaultDialog(
          middleText: 'Are you sure to save deatails?',
          onConfirm: () {
            addStudent(student);
            Get.back();
            Get.back();
          },
          onCancel: () {
            _stdnameController.clear();
            _stdageController.clear();
            _placeController.clear();
            _numberController.clear();
          });
      // Navigator.of(context).pop();
    }
  }
}
