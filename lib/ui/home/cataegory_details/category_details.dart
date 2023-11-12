import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/ui/home/cataegory_details/sources_tabs_widget.dart';

import '../categories/category.dart';

class CategoryDetails extends StatelessWidget {
  CategoryModel category;
  CategoryDetails(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data?.status == 'error') {
          return Center(
            child: Column(
              children: [
                Text(snapshot?.data?.message ?? snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: Text('Trt Again')),
              ],
            ),
          );
        }
        var sourcesList = snapshot.data?.sources;
        return SourceTabsWidget(sourcesList!);
      },
    );

  }
}
