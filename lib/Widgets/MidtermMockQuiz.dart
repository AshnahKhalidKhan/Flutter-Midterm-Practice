import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_midterm_practice/Model/product.dart';
import 'package:flutter_midterm_practice/Model/products_repository.dart';
import 'package:flutter_midterm_practice/Model/model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MidtermMockQuiz extends StatefulWidget 
{
  const MidtermMockQuiz({super.key});

  @override
  State<MidtermMockQuiz> createState() => _MidtermMockQuizState();
}

class _MidtermMockQuizState extends State<MidtermMockQuiz> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        leading: Icon(Icons.menu),
        title: Text("Products"),
        centerTitle: true,
      ),
      body: Container
      (
        child: FutureBuilder
          (
            future: _fetchingData(),
            builder: (context, snapshort)
            {
              if (snapshort.hasData)
              {
                return _buildingList(snapshort.data!);
              }
              else
              {
                return Text("Some error");
              }
            },
          ),
          
        )
    );
  }
}

Future<List<APIDataModel>> _fetchingData() async
{
  final response = await http.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
  if (response.statusCode == 200)
  {
    List<dynamic> _parsedList = jsonDecode(response.body);
    List<APIDataModel> _itemsList = List<APIDataModel>.from
    (
      _parsedList.map<APIDataModel>((dynamic i) => APIDataModel.fromJson(i))
    );
    return _itemsList;
  }
  else
  {
    throw Exception('Error');
  }
}

ListView _buildingList(List<APIDataModel> itemsList)
{
  return ListView.builder
  (
    itemCount: itemsList.length,
    itemBuilder: (context, i)
    {
      return ListTile
      (
        leading: Image.network(itemsList[i].imageLink.toString()),
        title: Text(itemsList[i].name.toString()),
        trailing: Text("\$" + itemsList[i].price.toString()),
        onTap: ()
        {
          showModalBottomSheet<void>
          (
            constraints: BoxConstraints
            (
              maxHeight: MediaQuery.of(context).size.height,
              // minHeight: MediaQuery.of(context).size.height
            ),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context)
            {
              return SizedBox
              (
                width: double.maxFinite,
                child: Wrap
                (
                  children: 
                  [
                    ListTile
                    (
                      leading: Image.network(itemsList[i].imageLink.toString()),
                      title: Text(itemsList[i].name.toString()),
                      subtitle: Text(itemsList[i].description.toString()),
                    ),
                    ListTile
                    (
                      leading: Text('Brand: ' + itemsList[i].brand.toString().toUpperCase()),
                      trailing: Text('Price: \$' + itemsList[i].price.toString()),
                    ),
                    ListTile
                    (
                      leading: Text('Product type: ' + itemsList[i].productType.toString().toUpperCase()),
                      trailing: Text('Rating: ' + itemsList[i].rating.toString()),
                    ),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: itemsList[i].productColors != null && itemsList[i].productColors!.isNotEmpty ? itemsList[i].productColors!.map((productColorsList)
                      {
                        return Padding
                        (
                          padding: EdgeInsets.all(5.0),
                          child: Wrap
                          (
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            // crossAxisAlignment: WrapCrossAlignment.end,
                            children:
                            [
                              CircleAvatar
                              (
                                backgroundColor: Color(int.parse((productColorsList.hexValue.toString()).replaceAll("#", "0xFF")),),
                              ),
                              SizedBox(width: 3.0),
                            ],
                          ),
                        );
                      }).toList() : <Widget>[], // Return an empty list if productColors is empty
                    ),
                    // Expanded
                    // (
                    //   child: Row
                    //   (
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: itemsList[i].productColors != null && itemsList[i].productColors!.isNotEmpty ? itemsList[i].productColors!.map((productColorsList)
                    //     {
                    //       return CircleAvatar
                    //       (
                    //         backgroundColor: Color(int.parse((productColorsList.hexValue.toString()).replaceAll("#", "0xFF")),),
                    //       );
                    //       // SizedBox(width: 3.0),
                    //     }).toList() : <Widget>[],
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          );
        },
      );
    }
  );
}