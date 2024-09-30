import '../../models/product_model.dart';
import 'product_service_impl.dart';

abstract interface class ProductService {
  Future<List<ProductModel>> getProducts(String? query, List<bool> type);

  factory ProductService() {
    return ProductServiceImpl();
  }
}
