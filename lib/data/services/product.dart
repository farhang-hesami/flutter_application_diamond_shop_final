import 'package:flutter_application_diamond_shop_final/data/models/product.dart';
import 'package:flutter_application_diamond_shop_final/utils/http_client.dart';

class ProductService {
  Future<ProductModel> getLatestProducts() async {
    var response = await httpClient.get('products?order=latest');
    return ProductModel.fromJson(response.data);
  }

  Future<ProductModel> getPopularProducts() async {
    var response = await httpClient.get('products?order=popular');
    return ProductModel.fromJson(response.data);
  }

  Future<ProductDetailModel> getDetailProduct(int productId) async {
    var response = await httpClient.get('products/$productId');
    return ProductDetailModel.fromJson(response.data);
  }

  Future<void> sendProductComment(Comments comment) async {
    await httpClient.post('comments', data: comment.toJson());
  }
}
