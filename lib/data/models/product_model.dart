import 'package:dummy_product/data/models/dimensions_model.dart';
import 'package:dummy_product/data/models/meta_model.dart';
import 'package:dummy_product/data/models/review_model.dart';
import 'package:dummy_product/domain/entities/product.dart';

import '../../utility/methods.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.price,
    required super.discountPercentage,
    required super.rating,
    required super.stock,
    required super.tags,
    required super.brand,
    required super.sku,
    required super.weight,
    required super.dimensions,
    required super.warrantyInformation,
    required super.shippingInformation,
    required super.availabilityStatus,
    required super.reviews,
    required super.returnPolicy,
    required super.minimumOrderQuantity,
    required super.meta,
    required super.images,
    required super.thumbnail,
  });

  factory ProductModel.empty() {
    return ProductModel(
      id: 0,
      title: '',
      description: '',
      category: '',
      price: 0.0,
      discountPercentage: 0.0,
      rating: 0.0,
      stock: 0,
      tags: [],
      brand: '',
      sku: '',
      weight: 0.0,
      dimensions: DimensionsModel.empty(),
      warrantyInformation: '',
      shippingInformation: '',
      availabilityStatus: '',
      reviews: [],
      returnPolicy: '',
      minimumOrderQuantity: 0,
      meta: MetaModel.empty(),
      images: [],
      thumbnail: '',
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: tryParseInt(json['id']),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: tryParseDouble(json['price']),
      discountPercentage: tryParseDouble(json['discountPercentage']),
      rating: tryParseDouble(json['rating']),
      stock: tryParseInt(json['stock']),
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      weight: tryParseDouble(json['weight']),
      dimensions: json['dimensions'] != null
          ? DimensionsModel.fromJson(json['dimensions'])
          : DimensionsModel.empty(),
      warrantyInformation: json['warrantyInformation'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => ReviewModel.fromJson(e))
              .toList() ??
          [],
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: tryParseInt(json['minimumOrderQuantity']),
      meta: json['meta'] != null
          ? MetaModel.fromJson(json['meta'])
          : MetaModel.empty(),
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}
