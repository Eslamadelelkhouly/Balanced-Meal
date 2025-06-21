import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class AddProductRepo {
  Future<Either<Map<String,dynamic>,Map<String,dynamic>>> addProduct({
    required List<ProductItem> selectProduct,
  });
}