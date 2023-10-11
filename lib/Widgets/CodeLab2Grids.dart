import 'package:flutter/material.dart';
import 'package:flutter_midterm_practice/Model/product.dart';
import 'package:flutter_midterm_practice/Model/products_repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


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
      body: GridView.count
      (
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildingCardsOfDynamicContent(context) + _buildingCardsOfSameType(3) +
        [
          Card
          (
            clipBehavior: Clip.antiAlias,
            child: Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [
                AspectRatio
                (
                  aspectRatio: 18.0 / 11.0,
                  child: Image.asset('lib/Assets/logo.jpg'),
                ),
                Padding
                (
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column
                  (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text('Title'),
                      const SizedBox(height: 8.0),
                      Text('Secondary Text'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}

List<Card> _buildingCardsOfSameType(int count)
{
  return List.generate
  (
    count, (int i)
    {
      return Card
      (
        clipBehavior: Clip.antiAlias,
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>
          [
            AspectRatio
            (
              aspectRatio: 18.0 / 11.0,
              child: Image.asset('lib/Assets/logo.jpg'),
            ),
            Padding
            (
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column
              (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  Text('Function say bana hua Tile'),
                  const SizedBox(height: 8.0),
                  Text('Secondary Text'),
                ],
              ),
            ),
          ],
        ),
      );
    }
  );
}


List<Card> _buildingCardsOfDynamicContent(BuildContext context)
{
  List<Product> products = ProductsRepository.loadProducts(Category.all);

  if (products.isEmpty) 
  {
    return const <Card>[];
  }

  final ThemeData theme = Theme.of(context);
  final NumberFormat formatter = NumberFormat.simpleCurrency
  (
      locale: Localizations.localeOf(context).toString()
  );

  return products.map((product)
  {
    return Card
    (
      clipBehavior: Clip.antiAlias,
      child: Column
      (
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          AspectRatio
          (
            aspectRatio: 18 / 11,
            child: Image.asset
            (
              product.assetName,
              package: product.assetPackage,
            ),
          ),
          Expanded
          (
            child: Padding
            (
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column
              (
               crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text
                  (
                    product.name,
                    style: theme.textTheme.titleLarge,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8.0),
                  Text
                  (
                    formatter.format(product.price),
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }).toList();
}