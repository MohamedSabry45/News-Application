import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/news_respons/news.dart';

class NewsWidget extends StatelessWidget {
  News news;

  NewsWidget(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child:CachedNetworkImage(
                imageUrl:news.urlToImage??"",
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),),
          Text(
            news.author??"",
            textAlign: TextAlign.start,
          ),
          Text(
            news.title??"",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          Text(
            news.publishedAt??"",
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
