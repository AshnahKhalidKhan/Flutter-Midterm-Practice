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

class GridPracticeModalBottomSheet extends StatefulWidget
{
  const GridPracticeModalBottomSheet({super.key});

  @override
  State<GridPracticeModalBottomSheet> createState() => _GridPracticeModalBottomSheetState();
}

class _GridPracticeModalBottomSheetState extends State<GridPracticeModalBottomSheet>
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
      return GestureDetector
      ( 
        child: Card
        (
          color: Colors.yellow,
          shape: RoundedRectangleBorder
          (
            borderRadius: BorderRadius.circular(20.0),
          ),
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
                  decoration: BoxDecoration
                  (
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Image.network
                  (
                    itemsList[i].thumbnail,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Text(itemsList[i].title),
              Text(itemsList[i].price.toString()),
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
        ),
        onTap: ()
        {
          showModalBottomSheet<void>
          (
            constraints: BoxConstraints
            (
              // maxHeight: MediaQuery.of(context).size.height,
              minWidth: double.infinity,
            ),
            // isScrollControlled: true,
            context: context,
            builder: (BuildContext context)
            {
              return Expanded
              (
                child: Column
                (
                  children: 
                  [
                    ListTile
                    (
                      title: Text(itemsList[i].title),
                      subtitle: Text(itemsList[i].description),
                    ),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: itemsList[i].images != null && itemsList[i].images.isNotEmpty ? itemsList[i].images.map((imageInList)
                      {
                        return CircleAvatar
                        (
                          radius: 30.0,
                          backgroundImage: NetworkImage(imageInList),
                        );
                      }).toList() : <Widget>[],
                    )
                  ],
                ),
              );
            }
          );
        },
      );
    },
  );
}
