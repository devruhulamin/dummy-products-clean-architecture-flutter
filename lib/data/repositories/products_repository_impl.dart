// lib/data/repositories/products_repository_impl.dart
import '../../domain/entities/product.dart';
import '../../domain/repositories/product__repo.dart';
import '../datasources/products_remote_data_source.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> fetchProducts({int skip = 0}) {
    return remoteDataSource.fetchProducts(skip: skip);
  }

  @override
  Future<List<Product>> searchProducts(String query) {
    return remoteDataSource.searchProducts(query);
  }
}
