import 'package:flutter/material.dart';
import 'package:flutter_midterm_practice/Widgets/CodeLab1Buttons.dart';
import 'package:flutter_midterm_practice/Widgets/CodeLab2Grids.dart';
import 'package:flutter_midterm_practice/Widgets/GridPracticeDummyJSONPhotos.dart';
import 'package:flutter_midterm_practice/Widgets/MidtermMockQuiz.dart';

void main() 
{
  runApp(const MainApp());
}

class MainApp extends StatelessWidget 
{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const MaterialApp
    (
      // home: CodeLab1Buttons(),
      // home: CodeLab2Grids(),
      // home: MidtermMockQuiz(),
      home: GridPracticeDummyJSONPhotos(),
    );
  }
}
