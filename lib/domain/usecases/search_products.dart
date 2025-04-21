import '../entities/product.dart';
import '../repositories/product__repo.dart';

class SearchProducts {
  final ProductsRepository repository;

  SearchProducts(this.repository);

  /// Returns only those products whose match the query
  Future<List<Product>> call(String query) {
    return repository.searchProducts(query.toLowerCase());
  }
}
