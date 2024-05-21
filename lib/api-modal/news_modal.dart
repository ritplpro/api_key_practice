class NewsModal{
  String? author;
  String? description;
  String? content;
  String? publishedAt;
  Source?  source;
  String? title;
  String? url;
  String? urlTolmage;

  NewsModal({
    required this.author,
    required this.description,
    required this.content,
    required this.publishedAt,
    required this.source,
    required this.title,
    required this.url,
    required this.urlTolmage});

  factory NewsModal.fromjson(Map<String,dynamic> json){
    return NewsModal(author: json["author"],
        description: json["description"],
        content: json["content"],
        publishedAt: json["publishedAt"],
        source: Source.fromjson(json["source"]),
        title: json["title"],
        url: json["url"],
        urlTolmage: json["urlToImage"]
    );
  }



}






class Source {
  String? id;
  String? name;
  Source({required this.id,required this.name});

  factory Source.fromjson(Map<String,dynamic> json){
    return Source(id: json["id"],
        name: json["name"]);
  }
}