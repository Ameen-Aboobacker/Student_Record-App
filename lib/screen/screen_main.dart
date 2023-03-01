import 'package:flutter/material.dart';
import 'package:hive_sample/screen/screen_input.dart';
import 'package:hive_sample/screen/screen_list.dart';
import 'package:hive_sample/screen/search.dart';

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        title: const Text('STUDENT LIST'),
        centerTitle: true,
        elevation: 3,
        leading: const Icon(
          Icons.school,
        ),
        leadingWidth: 56,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchProfile(),);
            },
            icon:const Icon(
              Icons.search,
            ),
          ),
        
        ],
        
      ),
      body: const SafeArea(
          child: ScreenList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ScreenInput()));
        },
        elevation: 5,
        child: const Icon(Icons.person_add),
      ),
    );
  }

  
}
