// {
//   "products":
//   [
//     {
//       "id":1,
//       "title":"iPhone 9",
//       "description":"An apple mobile which is nothing like apple",
//       "price":549,
//       "discountPercentage":12.96,
//       "rating":4.69,
//       "stock":94,
//       "brand":"Apple",
//       "category":"smartphones",
//       "thumbnail":"https://i.dummyjson.com/data/products/1/thumbnail.jpg",
//       "images":
//         [
//           "https://i.dummyjson.com/data/products/1/1.jpg",
//           "https://i.dummyjson.com/data/products/1/2.jpg",
//           "https://i.dummyjson.com/data/products/1/3.jpg",
//           "https://i.dummyjson.com/data/products/1/4.jpg",
//           "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
//         ]
//       },
//   ]
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GridPracticeDummyJSONPhotos extends StatefulWidget
{
  const GridPracticeDummyJSONPhotos({super.key});

  @override
  State<GridPracticeDummyJSONPhotos> createState() => _GridPracticeDummyJSONPhotosState();
}

class _GridPracticeDummyJSONPhotosState extends State<GridPracticeDummyJSONPhotos> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(),
      body: FutureBuilder
      (
        future: _fetchingData(),
        builder: (context, snapshot)
        {
          if (snapshot.hasData)
          {
            return _buildingGrid(snapshot.data!);
          }
          else if (snapshot.hasError)
          {
            print(snapshot.error);
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

class Gadgets
{
  final String title;
  final String description;
  final int price;
  final double rating;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  const Gadgets
  (
    {
      required this.title,
      required this.description,
      required this.price,
      required this.rating,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images,
    }
  );

  factory Gadgets.fromJson(Map<String, dynamic> json)
  {
    return Gadgets
    (
      title: json['title'], 
      description: json['description'], 
      price: json['price'],
      rating: json['rating'].toDouble(),
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images'])
    );
  }
}

Future<List<Gadgets>> _fetchingData() async
{
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));
  if (response.statusCode == 200)
  {
    List<dynamic> _parsedList = jsonDecode(response.body)['products'];
    List<Gadgets> _itemsList = List<Gadgets>.from
    (
      _parsedList.map<Gadgets>((dynamic i) => Gadgets.fromJson(i))
    );
    return _itemsList;
  }
  else
  {
    throw Exception('Errrorrrrrrrrrrr');
  }
}

GridView _buildingGrid(List<Gadgets> gadgetsList)
{
  return GridView.builder
  (
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
    (
      crossAxisCount: 2,
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 20.0,
    ),
    itemCount: gadgetsList.length, 
    itemBuilder: (context, i)
    {
      // return Card
      // (
      //   color: Colors.green,
      //   shape: RoundedRectangleBorder
      //   (
      //     side: BorderSide.none,
      //     borderRadius: BorderRadius.circular(20.0),
      //   ),
      //   child: Padding
      //   (
      //     padding: EdgeInsets.all(5.0),
      //     child: Column
      //     (
      //       children: 
      //       [
      //         Image.network(gadgetsList[i].thumbnail.toString()),
      //         Column
      //         (
      //           children:
      //           [
      //             Text(gadgetsList[i].title),
      //             Text(gadgetsList[i].description),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // );
      return GestureDetector
      (
        child: Card
        (
          // header: Image.network(gadgetsList[i].thumbnail.toString()),
          // footer: Text(gadgetsList[i].title),
          // child: Text(gadgetsList[i].description),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          color: Colors.yellow,
          child: Container
          (
            height: double.infinity,
            decoration: BoxDecoration
            (
              color: Colors.green,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage
              (
                image: NetworkImage(gadgetsList[i].thumbnail.toString()),
                fit: BoxFit.scaleDown,
                alignment: Alignment.bottomCenter,
              ),
            ),
            child: Column
            (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: 
              [
                // Image.network(gadgetsList[i].thumbnail.toString()),
                Text(gadgetsList[i].title),
                Text(gadgetsList[i].description),
              ],
            ),
          ),
        ),
        onTap: ()
        {
          showModalBottomSheet<void>
          (
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context)
            {
              return Card
              (
                child: Wrap
                (
                  direction: Axis.horizontal,
                  children: 
                  [
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: gadgetsList[i].images != null && gadgetsList[i].images.isNotEmpty ? gadgetsList[i].images.map((imageInList)
                      {
                        return CircleAvatar
                        (
                          radius: 30.0,
                          backgroundImage: NetworkImage(imageInList.toString()),
                        );
                      }).toList() : <Widget>[],
                    ),                    
                    Text(gadgetsList[i].price.toString()),
                    Text(gadgetsList[i].rating.toString()),
                    Text(gadgetsList[i].brand),
                    Text(gadgetsList[i].category),
                    ListTile
                    (
                      leading: Image.network(gadgetsList[i].thumbnail.toString()),
                      title: Text(gadgetsList[i].title),
                      subtitle: Text(gadgetsList[i].description),
                    ),
                  ] ,
                ),
              );
            }
          );
        },
      );
    }
  );
}
