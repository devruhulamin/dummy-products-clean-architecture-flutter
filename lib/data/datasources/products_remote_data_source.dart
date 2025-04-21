// lib/data/datasources/products_remote_data_source.dart

import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ProductsRemoteDataSource {
  final Dio dio;
  final String baseUrl;
  final int _limit = 12;

  ProductsRemoteDataSource({
    required this.dio,
    this.baseUrl = 'https://dummyjson.com',
  }) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 17),
      receiveTimeout: const Duration(seconds: 17),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  Future<List<ProductModel>> fetchProducts(
      {int skip = 0, String searchQuery = ''}) async {
    try {
      final response = await dio.get(
        '/products?search?q=$searchQuery&limit=$_limit&skip=$skip',
      );
      print(
          'api calling ---->/products?limit=$_limit&skip=$skip&search?q=$searchQuery <---------');
      final data = response.data as Map<String, dynamic>;
      final productJson = data['products'] as List<dynamic>;
      print("\n and response is $productJson");
      return productJson.map((e) => ProductModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch products: ${e.message}');
    }
  }

  Future<List<ProductModel>> filterProducts(String category) async {
    try {
      final response = await dio.get(
        '/products/category/$category',
      );
      final data = response.data as List<dynamic>;
      return data
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception('Product filter failed: ${e.message}');
    }
  }
}
