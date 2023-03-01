import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_sample/db/functions/db_functions.dart';
import 'package:hive_sample/db/models/data_model.dart';
import 'package:hive_sample/screen/screen_update.dart';

// ignore: must_be_immutable
class ScreenDetails extends StatefulWidget {
  ScreenDetails({
    super.key,
    required this.data,
    required this.index,
  });
  final StudentModel data;
  int index;

  @override
  State<ScreenDetails> createState() => _ScreenDetailsState();
}

class _ScreenDetailsState extends State<ScreenDetails> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
   
  

  @override
  Widget build(BuildContext context) {
    final name = widget.data.name;
   final age = widget.data.age;
   final place = widget.data.place;
   final number = widget.data.number;
    return Scaffold(
     
        appBar: AppBar(
        centerTitle: true,
        elevation: 3,
        title:  Text(name.toUpperCase()), 
        
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon:const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (cntxt) =>ScreenUpdate(data:widget.data, index: widget.index) ));
            },
            icon:const Icon(
              Icons.edit_sharp,
            ),
          ),
        
        ],
        
        leadingWidth: 56,
        ),
        body: Column(
          children:  [
           Text('Name :$name'),
           const SizedBox(
              height: 10,
            ),
            Text('Age :$age'),
           const SizedBox(
              height: 10,
            ),
            Text('Place :$place'),
           const SizedBox(
              height: 10,
            ),
            Text('Contact Number :$number'),
           const SizedBox(
              height: 10,
            ),
          ],
        ));
        
  }
}
