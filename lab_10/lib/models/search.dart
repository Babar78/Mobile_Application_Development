class Search {
  final List<String> tags;
  final String url;
  final String contentType;
  final String title;
  final String date;

  // Define constants for JSON keys
  static const String tagsKey = 'tags';
  static const String urlKey = 'url';
  static const String contentTypeKey = 'contentType';
  static const String titleKey = 'title';
  static const String dateKey = 'date';

  Search({
    required this.tags,
    required this.url,
    required this.contentType,
    required this.title,
    required this.date,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      tags: (json[tagsKey] as List<dynamic>?)
              ?.map((tag) => tag.toString())
              .toList() ??
          [],
      url: json[urlKey].toString(),
      contentType: json[contentTypeKey].toString(),
      title: json[titleKey].toString(),
      date: json[dateKey].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      tagsKey: tags.map((tag) => tag.toString()).toList(),
      urlKey: url.toString(),
      contentTypeKey: contentType.toString(),
      titleKey: title.toString(),
      dateKey: date.toString(),
    };
  }
}
