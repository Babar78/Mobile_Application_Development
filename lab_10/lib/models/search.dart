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
      tags: List<String>.from(json['tags']),
      url: json['url'],
      contentType: json['contentType'],
      title: json['title'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tags': tags,
      'url': url,
      'contentType': contentType,
      'title': title,
      'date': date,
    };
  }
}
