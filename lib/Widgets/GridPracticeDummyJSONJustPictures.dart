import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class GridPracticeDummyJSONJustPictures extends StatefulWidget
{
  const GridPracticeDummyJSONJustPictures({super.key});

  @override
  State<GridPracticeDummyJSONJustPictures> createState() => _GridPracticeDummyJSONJustPicturesState();
}

class _GridPracticeDummyJSONJustPicturesState extends State<GridPracticeDummyJSONJustPictures>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold();
  }
}

