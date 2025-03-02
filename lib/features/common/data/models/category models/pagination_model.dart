import 'package:ecommerce_app/features/common/data/models/category%20models/from_json_contract.dart';
import 'package:ecommerce_app/features/home/data/models/slider_model.dart';

class PaginationModel<T extends FromJsonContract> {
  List<T>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  PaginationModel(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  factory PaginationModel.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return PaginationModel(
      results: json['results'] != null
          ? List<T>.from(json['results'].map((v) => fromJson(v)))
          : null,
      total: json['total'],
      firstPage: json['first_page'],
      previous: json['previous'],
      next: json['next'],
      lastPage: json['last_page'],
    );
  }
}