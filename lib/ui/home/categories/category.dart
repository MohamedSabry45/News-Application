import 'package:flutter/material.dart';
import 'dart:ui';
class CategoryModel{
  String id;
  String title;
  Color color;
  String imageName;
  CategoryModel(this.id,this.title,this.color,this.imageName);
  static List<CategoryModel> getAllCategories(){
    return[
      CategoryModel('sports','Sports',Color(0xFFC91C22),'ball.png'),
      CategoryModel('general','General',Color(0xFF003E90),'Politics.png'),
      CategoryModel('health','Health',Color(0xFFED1E79),'health.png'),
      CategoryModel('business','Business',Color(0xFFCF7E48),'bussines.png'),
      CategoryModel('techology','Techology',Color(0xFF4882CF),'environment.png'),
      CategoryModel('science','Science',Color(0xFF22807D),'science.png'),
    ];
  }
}