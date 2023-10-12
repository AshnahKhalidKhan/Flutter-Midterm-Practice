
// // ---- Normal wali

// Future<List<ModelClassKaNaam>> _fetchingData() async
// {
//   final respnse = await http.get(Uri.parse('https://dummyjson.com/products'));
//   if (respnse.statusCode == 200)
//   {
//     List<dynamic> _parsedList = jsonDecode(respnse.body);
//     List<ModelClassKaNaam> _itemsList = List<ModelClassKaNaam>.from
//     (
//       _parsedList.map<ModelClassKaNaam>((dynamic i) => ModelClassKaNaam.fromJson(i))
//     );
//     return _itemsList;
//   }
//   else
//   {
//     throw Exception('Erorrr');
//   }
// }

// // ---- Agar is type ki hai kay body['products'] ka andar samaan hai

// Future<List<ModelClassKaNaam>> _fetchingData() async
// {
//   final respnse = await http.get(Uri.parse('https://dummyjson.com/products'));
//   if (respnse.statusCode == 200)
//   {
//     List<dynamic> _parsedList = jsonDecode(respnse.body)['products'];
//     List<ModelClassKaNaam> _itemsList = List<ModelClassKaNaam>.from
//     (
//       _parsedList.map<ModelClassKaNaam>((dynamic i) => ModelClassKaNaam.fromJson(i))
//     );
//     return _itemsList;
//   }
//   else
//   {
//     throw Exception('Erorrr');
//   }
// }

// // ---- Future Builder ka starter code to save time

//         child: FutureBuilder
//         (
//           future: _fetchingData(), 
//           builder: (context, snapshot)
//           {
//             if (snapshot.hasData)
//             {
//               return _buildingView(snapshot.data!);
//             }
//             if (snapshot.hasData)
//             {
//               return Text('$snapshot.error');
//             }
//             else
//             {
//               return CircularProgressIndicator();
//             }
//           }
//         ),

// // ---- ListView agar build karni hai to



// // ---- Warna agar GridView agar build karna hai to (donon kay function ka naam same rakho to save time)
// GridView _buildingView(List<ModelClassKaNaam> itemsList)
// {
//   return GridView.builder
//   (
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
//     (
//       crossAxisCount: 2,
//       crossAxisSpacing: 10.0,
//       mainAxisSpacing: 10.0,
//     ),
//     itemCount: itemsList.length,
//     itemBuilder: (context, i)
//     {
//       return Column
//       (
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: 
//         [
//           Expanded
//           (
//             child: Container
//             (
//               alignment: Alignment.topCenter,
//               decoration: BoxDecoration
//               (
//                 color: Colors.red,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Image.network(itemsList[i].thumbnail),
//             ),
//           ),
//           Container
//           (
//             color: Colors.green,
//             child: Text(itemsList[i].title.toString()),
//           ),
//           Container
//           (
//             width: double.infinity,
//             color: Colors.yellow,
//             child: Text(itemsList[i].category.toString()),
//           ),
//         ],
//       );
//     },
//   );
// }

