import 'package:e_commerce_app/data/model/response/category_response_dm/category_or_brands_response_dm.dart';
import 'package:e_commerce_app/domain/entities/category_or_brand_response_entity/category_or_brands_response_entity.dart';

class ProductResponseEntity {
  num? results;
  String? statusMsg;
  String? message;
  List<ProductEntity>? data;

  ProductResponseEntity(
      {this.results, this.data, this.message, this.statusMsg});
}

class ProductEntity {
  num? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryOrBrandsEntity? category;
  CategoryOrBrandsEntity? brand;
  num? ratingsAverage;

  ProductEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  ProductEntity.fromJson(Map<String, dynamic> json) {
    sold = json["sold"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    subcategory = json["subcategory"] == null
        ? null
        : (json["subcategory"] as List)
            .map((e) => SubcategoryEntity.fromJson(e))
            .toList();
    ratingsQuantity = json["ratingsQuantity"];
    id = json["_id"];
    title = json["title"];
    slug = json["slug"];
    description = json["description"];
    quantity = json["quantity"];
    price = json["price"];
    imageCover = json["imageCover"];
    category = json["category"] == null
        ? null
        : CategoryOrBrandsDM.fromJson(json["category"]);
    brand = json["brand"] == null
        ? null
        : CategoryOrBrandsDM.fromJson(json["brand"]);
    ratingsAverage = json["ratingsAverage"];

    id = json["id"];
  }
}

class SubcategoryEntity {
  String? id;
  String? name;
  String? slug;
  String? category;

  SubcategoryEntity({this.id, this.name, this.slug, this.category});

  SubcategoryEntity.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    category = json["category"];
  }
}
