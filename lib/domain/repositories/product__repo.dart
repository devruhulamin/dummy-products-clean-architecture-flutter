import 'package:dummy_product/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> fetchProducts();
  Future<List<Product>> searchProducts(String query);
}
