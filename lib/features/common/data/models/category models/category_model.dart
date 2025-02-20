import 'category_list_model.dart';

class CategoryModel {
  List<Results>? results;
  int? total;
  Null? firstPage;
  Null? previous;
  int? next;
  int? lastPage;

  CategoryModel(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['first_page'] = this.firstPage;
    data['previous'] = this.previous;
    data['next'] = this.next;
    data['last_page'] = this.lastPage;
    return data;
  }
}