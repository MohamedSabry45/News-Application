import 'package:flutter/material.dart';

import '../../../api/api_manager.dart';
import 'news_widget.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => showResults(context),
          icon: Icon(
            Icons.search,
            size: 30,
          )),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.close,
          size: 30,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.searchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.data?.status == 'error' || snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            ),
          );
        }
        var newsList = snapshot.data?.articles;
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsWidget(newsList![index]);
          },
          itemCount: newsList?.length ?? 0,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

}
