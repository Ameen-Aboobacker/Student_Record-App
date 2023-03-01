import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_sample/db/models/data_model.dart';

ValueNotifier<List<StudentModel>> studentdataNotifier = ValueNotifier([]);
void addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final index = await studentDB.add(value);
  value.id = index;
  studentDB.put(index, value);
  studentdataNotifier.value.add(value);
  studentdataNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentdataNotifier.value.clear();
  studentdataNotifier.value.addAll(studentDB.values);
  studentdataNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.delete(id);
  studentDB.clear();
  studentDB.addAll(studentdataNotifier.value);
  
  getAllStudents();
  
}

 updateStudent(int id, StudentModel model) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.putAt(id, model);
  await getAllStudents();
}
searchStudent(int id) async{
   final studentDB = await Hive.openBox<StudentModel>('student_db');
   final val=studentDB.getAt(id);
   studentdataNotifier.value.clear();
  studentdataNotifier.value.add(val!);
   await getAllStudents();
   studentdataNotifier.notifyListeners();
}
