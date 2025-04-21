import 'package:dio/dio.dart';
import 'package:dummy_product/data/datasources/products_remote_data_source.dart';
import 'package:dummy_product/data/repositories/products_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepoProvider = Provider<ProductsRepositoryImpl>((ref) {
  final dio = Dio();
  return ProductsRepositoryImpl(
      remoteDataSource: ProductsRemoteDataSource(
    dio: dio,
  ));
});
