import 'dart:ui';

import '../../../common/data/models/category models/category_pagination_model.dart';

class ProductListPaginationModel {
  int? code;
  String? status;
  String? msg;
  ProductModel? data;

  ProductListPaginationModel({this.code, this.status, this.msg, this.data});

  ProductListPaginationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? ProductModel.fromJson(json['data']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['code'] = this.code;
  //   data['status'] = this.status;
  //   data['msg'] = this.msg;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   return data;
  // }
}

class ProductModel {
  String? sId;
  String? title;
  Brand? brand;
  List<CategoryItemModel>? categories;
  String? slug;
  String? metaDescription;
  String? description;
  List<String>? photos;
  List<Color>? colors;
  List<String>? sizes;
  List<String>? tags;
  int? regularPrice;
  int? currentPrice;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProductModel(
      {this.sId,
        this.title,
        this.brand,
        this.categories,
        this.slug,
        this.metaDescription,
        this.description,
        this.photos,
        this.colors,
        this.sizes,
        this.tags,
        this.regularPrice,
        this.currentPrice,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    if (json['categories'] != null) {
      categories = <CategoryItemModel>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryItemModel.fromJson(v));
      });
    }
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    photos = json['photos'].cast<String>();
    // if (json['colors'] != null) {
    //   colors = <Color>[];
    //   json['colors'].forEach((v) {
    //     colors!.add(Color.fromJson(v));
    //   });
    // }
    // if (json['sizes'] != null) {
    //   sizes = <Null>[];
    //   json['sizes'].forEach((v) {
    //     sizes!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['tags'] != null) {
    //   tags = <Null>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(new Null.fromJson(v));
    //   });
    // }
    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   data['title'] = this.title;
  //   if (this.brand != null) {
  //     data['brand'] = this.brand!.toJson();
  //   }
  //   if (this.categories != null) {
  //     data['categories'] = this.categories!.map((v) => v.toJson()).toList();
  //   }
  //   data['slug'] = this.slug;
  //   data['meta_description'] = this.metaDescription;
  //   data['description'] = this.description;
  //   data['photos'] = this.photos;
  //   if (this.colors != null) {
  //     data['colors'] = this.colors!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.sizes != null) {
  //     data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.tags != null) {
  //     data['tags'] = this.tags!.map((v) => v.toJson()).toList();
  //   }
  //   data['regular_price'] = this.regularPrice;
  //   data['current_price'] = this.currentPrice;
  //   data['quantity'] = this.quantity;
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['__v'] = this.iV;
  //   return data;
  // }
}

class Brand {
  String? sId;
  String? title;
  String? slug;
  String? icon;

  Brand({this.sId, this.title, this.slug, this.icon});

  Brand.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    return data;
  }
}
