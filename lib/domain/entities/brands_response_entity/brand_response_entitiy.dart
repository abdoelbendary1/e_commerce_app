class BrandResponseEntity {
  int? results;
  String? statusMsg;
  String? message;
  List<BrandEntity>? data;

  BrandResponseEntity({
    this.results,
    this.data,
    this.message,
    this.statusMsg,
  });
}

class BrandEntity {
  String? id;
  String? name;
  String? slug;
  String? image;

  BrandEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });
}
