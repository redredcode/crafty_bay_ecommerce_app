//for later use with the new api

class CategoryPaginationModel {
  int? code;
  String? status;
  String? msg;
  PaginationData? data;

  CategoryPaginationModel({this.code, this.status, this.msg, this.data});

  CategoryPaginationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? PaginationData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PaginationData {
  // we could have also name this class as CategoryListDataModel just like SliderListDataModel
  List<CategoryItemModel>? results;
  int? total;
  Null? firstPage;
  Null? previous;
  int? next;
  int? lastPage;

  PaginationData(
      {this.results,
      this.total,
      this.firstPage,
      this.previous,
      this.next,
      this.lastPage});

  PaginationData.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <CategoryItemModel>[];
      json['results'].forEach((v) {
        results!.add(new CategoryItemModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['first_page'] = firstPage;
    data['previous'] = previous;
    data['next'] = next;
    data['last_page'] = lastPage;
    return data;
  }
}

class CategoryItemModel {
  // we could have also name this class as CategoryModel just like SliderModel
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? icon;
  Null? parent;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CategoryItemModel(
      {this.sId,
      this.title,
      this.slug,
      this.description,
      this.icon,
      this.parent,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CategoryItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    icon = json['icon'];
    parent = json['parent'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['icon'] = icon;
    data['parent'] = parent;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
