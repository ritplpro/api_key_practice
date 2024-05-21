import 'dart:convert';

import 'package:api_key_practice/api-modal/data_modal.dart';
import 'package:api_key_practice/details_news.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.menu))
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder(future: getApiData(),
          builder: (context,snap){
        if(snap.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else if(snap.hasError){
          return Text('${snap.error}');
        }else if(snap.hasData){
          return snap.hasData!=null ? ListView.builder(
              itemCount:snap.data!.articles!.length,
              itemBuilder:(context,index){
            var mData=snap.data!.articles![index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InkWell(onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>DetailsNews(newsdata:mData)));
                      },
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                            ),
                              child: Image.network("${mData.urlTolmage}",fit: BoxFit.fill,))),
                      SizedBox(height: 10),
                      Text(mData.title!),
                    ],
                  ),
                ),
              ),
            );
          }):Center(child: Text("no data found ..."));
        }
        return Container();

          }),
    );
  }


  Future<DataModal?> getApiData() async {
    DataModal? articales;
    var url="https://newsapi.org/v2/top-headlines?country=in&apiKey=baa55b94878e476b944ef2d496574f6c";
    var response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      var mData=response.body;
     var rawData=jsonDecode(mData);
     articales=DataModal.fromjson(rawData);

    }
    return articales;



  }

}
