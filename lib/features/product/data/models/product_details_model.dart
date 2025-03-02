import 'dart:ui';

import '../../../common/data/models/category models/category_pagination_model.dart';

class ProductDetailsModel {
  int? code;
  String? status;
  String? msg;
  ProductDetails? data;

  ProductDetailsModel({this.code, this.status, this.msg, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? ProductDetails.fromJson(json['data']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['code'] = code;
  //   data['status'] = status;
  //   data['msg'] = msg;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   return data;
  // }
}

class ProductDetails {
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

  ProductDetails(
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

  ProductDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    if (json['categories'] != null) {
      categories = <CategoryItemModel>[];
      json['categories'].forEach((v) {
        categories!.add(new CategoryItemModel.fromJson(v));
      });
    }
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    photos = json['photos'].cast<String>();
    // if (json['colors'] != null) {
    //   colors = <Color>[];
    //   json['colors'].forEach((v) {
    //     colors!.add(new Color.fromJson(v));
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

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['_id'] = sId;
  //   data['title'] = title;
  //   data['slug'] = slug;
  //   data['icon'] = icon;
  //   return data;
  // }
}
