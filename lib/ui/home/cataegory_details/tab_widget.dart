import 'package:flutter/material.dart';

import '../../../source_respons/Sources.dart';

class TabWidget extends StatelessWidget {
  Sources source;
  bool isSelected;
   TabWidget(this.source,this.isSelected,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal:12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
            color: isSelected?Colors.green:Colors.white,
        border: Border.all(color:Colors.green,width: 2),
      ),
    child:Text(source.name??"",
    style: TextStyle(
      color: isSelected? Colors.white:Colors.green,
    ),) ,
    );
  }
}
