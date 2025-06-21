import 'package:balancedmeal/core/API/api_service.dart';
import 'package:balancedmeal/core/API/backend_endpoint.dart';
import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Order%20Summary/data/repo/add_product_repo.dart';
import 'package:dartz/dartz.dart';

class AddProductRepoImplemenation extends AddProductRepo {
  final ApiService apiService;
  AddProductRepoImplemenation(this.apiService);
  @override
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> addProduct({
    required List<ProductItem> selectProduct,
  }) async {
    try {
      final itemsJson = selectProduct.map((product) {
        return {
          'name': product.foodName,
          'total_price': product.totalPrice,
          'quantity': product.quantity,
        };
      }).toList();

      var response = await apiService.Post(
        endpoint: BackendEndpoint.AddProdut,
        data: {
          "items": itemsJson,
        },
      );

      return Right(response);
    } catch (e) {
      return Left({'error': e.toString()});
    }
  }
}
