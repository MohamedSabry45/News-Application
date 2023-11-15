import 'package:flutter/material.dart';
import 'package:news/ui/home/News/search_deails.dart';
import 'package:news/ui/home/cataegory_details/category_details.dart';
import 'package:news/ui/home/categories/categoris_frag.dart';
import 'package:news/ui/home/categories/category.dart';
import 'package:news/ui/home/home_drawer.dart';
import 'package:news/ui/home/settings/settings_frag.dart';

//5c12e477898941c590efd00ca550d027
class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesFragment(onCategoryItemClick);
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Scaffold(
        drawer: HomeDrawer(onMenueItemClick),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: ()=>showSearch(context: context,
                delegate: NewsSearchDelegate()),
              icon: Icon(Icons.search,
                size: 30,color: Colors.white,),)
          ],
          title: Text(
            'News App',
            style: TextStyle(color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,),
          ),
        ),
        /*body: FutureBuilder<SourseRespons>(
            future: ApiManager.getSourses(),
            builder: (context, snapshot) {
              var connectionState;
              if (snapshot.connectionState == connectionState.waiting) {
                return Center(
                  child: CircularprogressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("some went wrong"),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                  ],
                );
              }
              if (snapshot.data?.status != 'ok') {
                return Column(
                  children: [
                    Text(snapshot.data?.massage ?? ""),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                  ],
                );
              }
              var sourceList = snapshot.data?.sources ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Text(sourceList[index].name ?? "");
                },
                itemCount: sourceList.length,
              );
            }),

         */
        body: selectedWidget,
      ),
    );
  }

  late Widget selectedWidget;

  void onMenueItemClick(MenuItem item) {
    Navigator.pop(context);
    switch (item) {
      case MenuItem.categories:
        {
          selectedWidget = CategoriesFragment(onCategoryItemClick);
        }
      case MenuItem.settings:
        {
          selectedWidget = SettingsFragment();
        }
    }
    setState(() {});
  }

  void onCategoryItemClick(CategoryModel categoryModel) {
    selectedWidget = CategoryDetails(categoryModel);
    setState(() {});
  }
}
