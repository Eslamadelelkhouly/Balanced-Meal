import 'dart:developer';

import 'package:balancedmeal/core/API/api_service.dart';
import 'package:balancedmeal/core/API/backend_endpoint.dart';
import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Order%20Summary/data/repo/add_product_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
      log(response.toString());
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
        if (e.response != null && e.response?.data != null) {
          return left(Map<String, dynamic>.from(e.response!.data));
        } else {
          return left(
              {"message": "Connection timeout with ApiServer", "errors": {}});
        }
      } else {
        return left({"message": "Unexpected Error", "errors": {}});
      }
    }
  }
}
