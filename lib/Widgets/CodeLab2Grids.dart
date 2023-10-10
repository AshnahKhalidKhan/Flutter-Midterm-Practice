import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CodeLab2Grids extends StatefulWidget
{
  const CodeLab2Grids({super.key});

  @override
  State<CodeLab2Grids> createState() => _CodeLab2GridsState();
}

class _CodeLab2GridsState extends State<CodeLab2Grids>
{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.deepPurple,
        leading: Icon(Icons.menu),
        title: Text('SHRINE'),
        actions: 
        [
          IconButton
          (
            onPressed: () {}, 
            icon: Icon(Icons.search),
          ),
          IconButton
          (
            onPressed: () {}, 
            icon: Icon(Icons.tune),
          ),
        ],
      ),
      // body: 
    );
  }
}