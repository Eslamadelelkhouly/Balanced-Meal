import 'dart:developer';
import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Home/data/repos/get_product_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class GetProductRepoImplementaion extends GetProductRepo {
  @override
  Future<Either<String, ProductCategoryModel>> getProduct() async {
    try {
      final firestore = FirebaseFirestore.instance;

      final vegetableDoc =
          await firestore.collection('products').doc('Vegetable').get();
      final carbDoc = await firestore.collection('products').doc('Carb').get();
      final meatDoc = await firestore.collection('products').doc('Meat').get();

      List<ProductItem> vegetables = [];
      List<ProductItem> carbs = [];
      List<ProductItem> meats = [];

      if (vegetableDoc.exists) {
        final items = vegetableDoc.data()?['items'] ?? [];
        vegetables = (items as List)
            .map((item) => ProductItem.fromJson(item as Map<String, dynamic>))
            .toList();
      }

      if (carbDoc.exists) {
        final items = carbDoc.data()?['items'] ?? [];
        carbs = (items as List)
            .map((item) => ProductItem.fromJson(item as Map<String, dynamic>))
            .toList();
      }

      if (meatDoc.exists) {
        final items = meatDoc.data()?['items'] ?? [];
        meats = (items as List)
            .map((item) => ProductItem.fromJson(item as Map<String, dynamic>))
            .toList();
      }

      final categorized = ProductCategoryModel(
        vegetables: vegetables,
        carbs: carbs,
        meats: meats,
      );

      log('Vegetables: ${vegetables.length}, Carbs: ${carbs.length}, Meats: ${meats.length}');
      return Right(categorized);
    } catch (e) {
      log('Error: $e');
      return Left(e.toString());
    }
  }
}
