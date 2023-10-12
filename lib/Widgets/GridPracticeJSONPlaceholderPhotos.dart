import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GridPracticeJSONPlaceholderPhotos extends StatefulWidget
 {
  const GridPracticeJSONPlaceholderPhotos({super.key});

  @override
  State<GridPracticeJSONPlaceholderPhotos> createState() => _GridPracticeJSONPlaceholderPhotosState();
}

class _GridPracticeJSONPlaceholderPhotosState extends State<GridPracticeJSONPlaceholderPhotos>
 {
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: FutureBuilder
      (
        future: _fetchingData(),
        builder: (context, snapshot)
        {
          if (snapshot.hasData)
          {
            return _buildingListOfColors(snapshot.data!);
          }
          else if (snapshot.hasError)
          {
            return Text('$snapshot.error');
          } 
          else
          {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

// {
//     "albumId": 1,
//     "id": 1,
//     "title": "accusamus beatae ad facilis cum similique qui sunt",
//     "url": "https://via.placeholder.com/600/92c952",
//     "thumbnailUrl": "https://via.placeholder.com/150/92c952"
// },

class Albums
{
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Albums
  (
    {
      required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl,
    }
  );

  factory Albums.fromJson(Map<String, dynamic> json)
  {
    return Albums
    (
      albumId: json['albumId'], 
      id: json['id'], 
      title: json['title'], 
      url: json['url'], 
      thumbnailUrl: json['thumbnailUrl']
    );
  }
}

Future<List<Albums>> _fetchingData() async
{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  if (response.statusCode == 200)
  {
    List<dynamic> _parsedList = jsonDecode(response.body);
    List<Albums> _itemsList = List<Albums>.from
    (
      _parsedList.map<Albums>((dynamic i) => Albums.fromJson(i))
    );
    return _itemsList;
  }
  else
  {
    throw Exception('Eorrrror');
  }
}

GridView _buildingListOfColors(List<Albums> itemsList)
{
  return GridView.builder
  (
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
    (
      crossAxisCount: 2,
    ),
    itemCount: itemsList.length,
    itemBuilder: (context, i)
    {
      return GridTile
      (
        child: Card
        (
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
              Expanded
              (
                child: Image.network
                (
                  itemsList[i].thumbnailUrl,
                ),
              ),
              Text
              (
                itemsList[i].title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    },
  );
}