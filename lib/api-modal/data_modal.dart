import 'package:api_key_practice/api-modal/news_modal.dart';

class DataModal{
  String? status;
  int? totalResult;
  List<NewsModal>? articles;
  DataModal({required this.status,required this.totalResult,required this.articles});


  factory DataModal.fromjson(Map<String,dynamic>json){
    List<NewsModal> allarticles=[];

    for(Map<String,dynamic> jsonModal in json["articles"]){
      allarticles.add(NewsModal.fromjson(jsonModal));
    }
    return DataModal(status: json["status"],
        totalResult: json["totalResult"],
        articles: allarticles);

  }



}