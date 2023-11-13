import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/news_respons/news.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../my_theme.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  static const String routeName = "NewsDetails Screen";


  @override
  Widget build(BuildContext context) {
    var news = ModalRoute
        .of(context)
        ?.settings
        .arguments as News;
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            const SizedBox(
              width: 20,
// SizedBox
            )
          ],
          centerTitle: true,
          title: const Text('News Title'),
          backgroundColor: Colors.green,
          shape: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)))
        // BorderRadius.only // OutlineInputBor
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? "",
                  width: double.infinity,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.3,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.author ?? "",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 14, color: Colors.green),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.title ?? "",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Text(news.content!),
            Text(news.publishedAt ?? "",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 14, color: Colors.green),
                textAlign: TextAlign.end),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: ()=>_launchurl(news.url!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('View Full Article'),
                  Icon(Icons.arrow_back_ios),
                ],
              ),
            )
          ], // Text
        ), // Column
      ),
    );
    // scaffold
  }

  Future<void> _launchurl(String url) async {
    var uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
