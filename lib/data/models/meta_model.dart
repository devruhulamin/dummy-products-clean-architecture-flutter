import 'package:dummy_product/domain/entities/product.dart';

import '../../domain/entities/meta.dart';
import '../../utility/methods.dart';

class MetaModel extends Meta {
  MetaModel({
    required super.createdAt,
    required super.updatedAt,
    required super.barcode,
    required super.qrCode,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      createdAt: tryParseDateTime(json['createdAt']),
      updatedAt: tryParseDateTime(json['updatedAt']),
      barcode: json['barcode'] ?? '',
      qrCode: json['qrCode'] ?? '',
    );
  }

  factory MetaModel.empty() => MetaModel(
        createdAt: DateTime(1970),
        updatedAt: DateTime(1970),
        barcode: '',
        qrCode: '',
      );
}
