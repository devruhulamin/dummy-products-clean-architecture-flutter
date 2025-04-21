import 'package:dummy_product/presentation/notifier/products_notifier.dart';
import 'package:dummy_product/presentation/pages/products_list.dart';
import 'package:dummy_product/presentation/providers/search_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/pages/widgets/search_bar.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsNotifier = ref.watch(productsNotifierProvider.notifier);
    return MaterialApp(
      title: 'Clothing Store',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 14),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            productsNotifier.refreshProducts();
            ref.read(searchTextProvider.notifier).state = '';
            return Future.value();
          },
          child: const Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                children: [
                  SearchBarWithFilter(),
                  Expanded(child: ProductsList()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
