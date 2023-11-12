import 'package:flutter/material.dart';
import 'package:news/ui/home/cataegory_details/tab_widget.dart';

import '../../../source_respons/Sources.dart';
import '../News/news_list_widget.dart';

class SourceTabsWidget extends StatefulWidget{
  List<Sources> sources;
 SourceTabsWidget(this.sources ,{super.key});

  @override
  State<SourceTabsWidget> createState() => _SourceTabsWidgetState();
}

class _SourceTabsWidgetState extends State<SourceTabsWidget> {
int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          SizedBox(height:12 ,),
          TabBar(
            indicatorColor: Colors.transparent,
            onTap: (newIndex){
              selectedIndex=newIndex;
              setState((){});
            },
              isScrollable:true,
              tabs: widget.sources.map((source) => TabWidget( source,
              widget.sources.indexOf(source)==selectedIndex
              )).toList()),
          Expanded(child: NewsListWidget(widget.sources[selectedIndex]))

        ],
      ),
    );
  }
}
