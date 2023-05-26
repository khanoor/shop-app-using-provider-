// To parse this JSON data, do
//
//     final productClassModel = productClassModelFromJson(jsonString);

import 'dart:convert';

ProductClassModel productClassModelFromJson(String str) =>
    ProductClassModel.fromJson(json.decode(str));

String productClassModelToJson(ProductClassModel data) =>
    json.encode(data.toJson());

class ProductClassModel {
  List<ProductDescription>? products;
  int? total;
  int? skip;
  int? limit;

  ProductClassModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory ProductClassModel.fromJson(Map<String, dynamic> json) =>
      ProductClassModel(
        products: List<ProductDescription>.from(
            json["products"].map((x) => ProductDescription.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class ProductDescription {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  ProductDescription({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory ProductDescription.fromJson(Map<String, dynamic> json) =>
      ProductDescription(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"].toDouble(),
        rating: json["rating"].toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images!.map((x) => x)),
      };
}
