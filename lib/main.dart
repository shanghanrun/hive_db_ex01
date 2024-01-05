import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_db_ex01/model/student.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Student>(StudentAdapter());
  final box = await Hive.openBox<Student>('student_class_table');

  final student = Student(name: 'Choco', age: 30);
  box.add(student);
  box.put('1st', student);
  print(box.toMap());
  print(box.get('1st'));
  print(box.getAt(1));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hive example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Container());
  }
}
