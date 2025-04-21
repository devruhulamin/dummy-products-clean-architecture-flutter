import 'package:dummy_product/domain/entities/product.dart';

import '../../domain/entities/dimensions.dart';
import '../../utility/methods.dart';

class DimensionsModel extends Dimensions {
  DimensionsModel({
    required super.width,
    required super.height,
    required super.depth,
  });

  factory DimensionsModel.fromJson(Map<String, dynamic> json) {
    return DimensionsModel(
      width: tryParseDouble(json['width']),
      height: tryParseDouble(json['height']),
      depth: tryParseDouble(json['depth']),
    );
  }

  factory DimensionsModel.empty() =>
      DimensionsModel(width: 0, height: 0, depth: 0);
}
