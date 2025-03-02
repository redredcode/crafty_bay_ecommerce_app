// not in use

class CategoryListModel { // renamed CategoryModel to CategoryListModel
  int? code;
  String? status;
  String? msg;
  CategoryListModel? categoryList;

  CategoryListModel({this.code, this.status, this.msg, this.categoryList});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    categoryList = json['data'] != null ? CategoryListModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['msg'] = msg;
    if (categoryList != null) {
      data['data'] = categoryList!.toJson();
    }
    return data;
  }
}



class Results { // categories
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? icon;
  Null? parent;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Results(
      {this.sId,
        this.title,
        this.slug,
        this.description,
        this.icon,
        this.parent,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Results.fromJson(Map<String, dynamic> json) {
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