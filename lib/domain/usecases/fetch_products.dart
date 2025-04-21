import '../entities/product.dart';
import '../repositories/product__repo.dart';

class FetchProducts {
  final ProductsRepository repository;
  FetchProducts(this.repository);

  /// this method returns the full product list.
  Future<List<Product>> call() {
    return repository.fetchProducts();
  }
}
