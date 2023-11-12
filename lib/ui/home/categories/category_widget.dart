import 'package:flutter/material.dart';
import 'package:news/ui/home/categories/category.dart';


class CategoryItem extends StatelessWidget {
  CategoryModel category;
  int index;
   CategoryItem(this.category,this.index,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topRight:Radius.circular(24),
          topLeft: Radius.circular(24),
          bottomRight: Radius.circular(index.isEven?0:24),
          bottomLeft:Radius.circular(index.isEven?24:0)

        )
      ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children :[
    Image.asset('assets/images/${category.imageName}',
    height: 120,
      width: double.infinity,
      fit: BoxFit.fitHeight,
    ),
      Text(category.title,
        style: TextStyle(
            fontSize: 22,
          color: Colors.white),)
  ],
    ),
    );
  }
}
