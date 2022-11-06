import 'hit.dart';

class EdamamModel {
  int? from;
  int? to;
  int? count;
  String? nextHref;
  List<Hit>? hits;

  EdamamModel({
    this.from,
    this.to,
    this.count,
    this.nextHref,
    this.hits,
  });

  factory EdamamModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return EdamamModel(
      from: json['from'],
      to: json['to'],
      count: json['count'],
      nextHref: json['_links']['next'] == null
          ? null
          : json['_links']['next']['href'],
      hits: json['hits'] == null || (json['hits'] as List).isEmpty
          ? null
          : (json['hits'] as List).map((e) => Hit.fromJson(e)).toList(),
    );
  }
}
