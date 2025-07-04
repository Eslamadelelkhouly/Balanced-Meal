part of 'get_product_cubit.dart';

@immutable
sealed class GetProductState {}

final class GetProductInitial extends GetProductState {}

final class GetProductLoading extends GetProductState {}

final class GetProductSuccess extends GetProductState {
  final ProductCategoryModel productCategoryModel;

  GetProductSuccess(this.productCategoryModel);
}

final class GetProductFailure extends GetProductState {
  final String errorMessage;

  GetProductFailure(this.errorMessage);
}
