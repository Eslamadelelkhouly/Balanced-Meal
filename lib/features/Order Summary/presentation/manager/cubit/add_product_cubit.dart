import 'package:balancedmeal/core/API/api_service.dart';
import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Order%20Summary/data/repo/add_product_repo_implemenation.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  ApiService apiService = ApiService(dio: Dio());
  Future<void> addProduct({
    required List<ProductItem> selectProduct,
  }) async {
    emit(AddProductLoading());
    var result = await AddProductRepoImplemenation(apiService)
        .addProduct(selectProduct: selectProduct);
    result.fold(
      (error) {
        emit(AddProductFailure(errorData: error));
      },
      (success) {
        emit(AddProductSuccess(success));
      },
    );
  }
}
