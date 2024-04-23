// models/search.dart
class Search {
  final List<String> tags;
  final String url;
  final String contentType;
  final String title;
  final String date;

  Search({
    required this.tags,
    required this.url,
    required this.contentType,
    required this.title,
    required this.date,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      tags: (json['tags'] as List<dynamic>?)
              ?.map((tag) => tag.toString())
              .toList() ??
          [],
      url: json['url'].toString(),
      contentType: json['contentType'].toString(),
      title: json['title'].toString(),
      date: json['date'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tags': tags.map((tag) => tag.toString()).toList(),
      'url': url.toString(),
      'contentType': contentType.toString(),
      'title': title.toString(),
      'date': date.toString(),
    };
  }
}
