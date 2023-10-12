import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_midterm_practice/Widgets/GridPracticeDummyJSONPhotos.dart';
import 'package:http/http.dart' as http;

class GridPracticeDummyJSONJustPictures extends StatefulWidget
{
  const GridPracticeDummyJSONJustPictures({super.key});

  @override
  State<GridPracticeDummyJSONJustPictures> createState() => _GridPracticeDummyJSONJustPicturesState();
}

Future<List<Gadgets>> _fetchingData() async
{
  final respnse = await http.get(Uri.parse('https://dummyjson.com/products'));
  if (respnse.statusCode == 200)
  {
    List<dynamic> _parsedList = jsonDecode(respnse.body)['products'];
    List<Gadgets> _itemsList = List<Gadgets>.from
    (
      _parsedList.map<Gadgets>((dynamic i) => Gadgets.fromJson(i))
    );
    return _itemsList;
  }
  else
  {
    throw Exception('Erorrr');
  }
}

class _GridPracticeDummyJSONJustPicturesState extends State<GridPracticeDummyJSONJustPictures>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: Padding
      (
        padding: EdgeInsets.all(10.0),
        child: FutureBuilder
        (
          future: _fetchingData(), 
          builder: (context, snapshot)
          {
            if (snapshot.hasData)
            {
              return _buildingGridsLikeInVideo(snapshot.data!);
            }
            if (snapshot.hasData)
            {
              return Text('$snapshot.error');
            }
            else
            {
              return CircularProgressIndicator();
            }
          }
        ),
      ),
    );
  }
}

GridView _buildingGridsLikeInVideo(List<Gadgets> itemsList)
{
  return GridView.builder
  (
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
    (
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
    ),
    itemCount: itemsList.length,
    itemBuilder: (context, i)
    {
      return Column
      (
        crossAxisAlignment: CrossAxisAlignment.center,
        children: 
        [
          Expanded
          (
            child: Container
            (
              alignment: Alignment.topCenter,
              decoration: BoxDecoration
              (
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(itemsList[i].thumbnail),
            ),
          ),
          Container
          (
            color: Colors.green,
            child: Text(itemsList[i].title.toString()),
          ),
          Container
          (
            width: double.infinity,
            color: Colors.yellow,
            child: Text(itemsList[i].category.toString()),
          ),
        ],
      );
    },
  );
}

