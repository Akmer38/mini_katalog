import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  static const String _baseUrl = 'https://dummyjson.com';

  // Tüm ürünleri getir
  static Future<List<Product>> getProducts({
    int limit = 30,
    int skip = 0,
  }) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/products?limit=$limit&skip=$skip'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List products = data['products'];
      return products.map((p) => Product.fromJson(p)).toList();
    } else {
      throw Exception('Ürünler yüklenemedi');
    }
  }

  // Kategoriye göre ürün getir
  static Future<List<Product>> getProductsByCategory(String category) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/products/category/$category'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List products = data['products'];
      return products.map((p) => Product.fromJson(p)).toList();
    } else {
      throw Exception('Kategori ürünleri yüklenemedi');
    }
  }

  // Ürün ara
  static Future<List<Product>> searchProducts(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/products/search?q=$query'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List products = data['products'];
      return products.map((p) => Product.fromJson(p)).toList();
    } else {
      throw Exception('Arama başarısız');
    }
  }

  // Kategorileri getir
  static Future<List<String>> getCategories() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/products/category-list'),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => e.toString()).toList();
    } else {
      throw Exception('Kategoriler yüklenemedi');
    }
  }
}
