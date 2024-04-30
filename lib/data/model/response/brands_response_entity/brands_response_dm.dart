import 'package:e_commerce_app/domain/entities/brands_response_entity/brand_response_entitiy.dart';

class BrandsResponseDm extends BrandResponseEntity {
  Metadata? metadata;

  BrandsResponseDm({super.results, this.metadata, super.data});

  BrandsResponseDm.fromJson(Map<String, dynamic> json) {
    results = json["results"];
    metadata =
        json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => BrandsDM.fromJson(e)).toList();
  }
}

class BrandsDM extends BrandEntity {
  String? createdAt;
  String? updatedAt;

  BrandsDM(
      {super.id,
      super.name,
      super.slug,
      super.image,
      this.createdAt,
      this.updatedAt});

  BrandsDM.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    image = json["image"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json["currentPage"];
    numberOfPages = json["numberOfPages"];
    limit = json["limit"];
    nextPage = json["nextPage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["numberOfPages"] = numberOfPages;
    _data["limit"] = limit;
    _data["nextPage"] = nextPage;
    return _data;
  }
}
