part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}
final class AddProductSuccess extends AddProductState {
  final Map<String, dynamic> response;

  AddProductSuccess(this.response);
}
final class AddProductFailure extends AddProductState {
  final Map<String, dynamic> errorData;

  AddProductFailure({required this.errorData});

}