import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_midterm_practice/Model/GadgetsModel.dart';
import 'package:http/http.dart' as http;


// ---- Agar is type ki hai kay body['products'] ka andar samaan hai

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

class GridPracticeCard extends StatefulWidget
{
  const GridPracticeCard({super.key});

  @override
  State<GridPracticeCard> createState() => _GridPracticeCardState();
}

class _GridPracticeCardState extends State<GridPracticeCard>
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: Padding
      (
        padding: EdgeInsets.all(5.0),
        child: FutureBuilder
        (
          future: _fetchingData(), 
          builder: (context, snapshot)
          {
            if (snapshot.hasData)
            {
              return _buildingView(snapshot.data!);
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
      )
    );
  }
}


GridView _buildingView(List<Gadgets> itemsList)
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
      return Card
      (
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
            Expanded
            (
              child: Container
              (
                width: double.infinity,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration
                (
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Image.network(itemsList[i].thumbnail),
              ),
            ),
            Expanded
            (
              child: Container
              (
                width: double.infinity,
                decoration: BoxDecoration
                (
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Image.network
                (
                  itemsList[i].thumbnail,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(itemsList[i].title),
            Text(itemsList[i].price.toString()),
            Expanded
            (
              child: Container
              (
                width: double.infinity,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration
                (
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Image.asset
                (
                  'lib/Assets/logo.jpg',
                  width: double.maxFinite,
                ),
              ),
            ),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.end,
              children: 
              [
                Icon(Icons.health_and_safety),
                Icon(Icons.notifications),
              ],
            ),
          ],
        ),
      );
    },
  );
}

