import 'package:dummy_product/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> fetchProducts({int skip = 0});
  Future<List<Product>> searchProducts(String query);
}
