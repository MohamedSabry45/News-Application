import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/ui/home/News/news_widget.dart';

import '../../../source_respons/Sources.dart';

class NewsListWidget extends StatelessWidget {
  Sources source;
   NewsListWidget(this.source,{super.key});
   
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManager.getNews(source.id),
        builder: (context,snapshot){
      if(snapshot.connectionState ==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
      if(snapshot.data?.status =='error'||snapshot.hasError){
        return Center(
          child: Column(
            children: [
              Text(snapshot.data?.message??
              snapshot.error.toString()
              ),
              ElevatedButton(onPressed: (){}, child: Text('Try Again'))
            ],
          ),
        );
      }
      var newsList = snapshot.data?.articles;
          return ListView.builder(itemBuilder: (context,index){
            return NewsWidget(newsList![index]);
          },itemCount:newsList?.length??0,);
        },);

  }
}
