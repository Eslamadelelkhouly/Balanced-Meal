import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class GetProductRepo {
  Future<Either<String,ProductCategoryModel>> getProduct();
}