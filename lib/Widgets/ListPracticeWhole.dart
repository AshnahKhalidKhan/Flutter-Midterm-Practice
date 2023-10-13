// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_midterm_practice/Model/GadgetsModel.dart';
// import 'package:http/http.dart' as http;

// Future<List<Gadgets>> _fetchingData() async
// {
//   final respnse = await http.get(Uri.parse('https://dummyjson.com/products'));
//   if (respnse.statusCode == 200)
//   {
//     List<dynamic> _parsedList = jsonDecode(respnse.body)['products'];
//     List<Gadgets> _itemsList = List<Gadgets>.from
//     (
//       _parsedList.map<Gadgets>((dynamic i) => Gadgets.fromJson(i))
//     );
//     return _itemsList;
//   }
//   else
//   {
//     throw Exception('Erorrr');
//   }
// }

// class ListPracticeWhole extends StatefulWidget
//  {
//   const ListPracticeWhole({super.key});

//   @override
//   State<ListPracticeWhole> createState() => _ListPracticeWholeState();
// }

// class _ListPracticeWholeState extends State<ListPracticeWhole>
//  {
//   @override
//   Widget build(BuildContext context)
//    {
//     return Scaffold
//     (
//       body: Padding
//       (
//         padding: EdgeInsets.all(5.0),
//         child: FutureBuilder
//         (
//           future: _fetchingData(), 
//           builder: (context, snapshot)
//           {
//             if (snapshot.hasData)
//             {
//               return _buildingView(snapshot.data!);
//             }
//             else if (snapshot.hasError)
//             {
//               return Text('$snapshot.error');
//             }
//             else
//             {
//               return CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// ListView _buildingView(List<Gadgets> itemsList)
// {
//   return ListView.builder
//   (
//     itemBuilder: itemBuilder
//   );
// }