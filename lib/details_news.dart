
import 'package:api_key_practice/api-modal/news_modal.dart';
import 'package:flutter/material.dart';

class DetailsNews extends StatelessWidget {

  NewsModal? newsdata;
  DetailsNews({required this.newsdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsdata!.source!.name!),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Date : ${newsdata!.publishedAt.toString()}"),
              SizedBox(height: 10,),
              Image.network("${newsdata!.urlTolmage}"),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Reporter:${newsdata!.author}",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 10,),
              Text("Reporter:${newsdata!.title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 10,),
              Text("Description:${newsdata!.description}",style: TextStyle(fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Text(newsdata!.content!),
          
            ],
          ),
        ),
      ),
    );
  }
}
