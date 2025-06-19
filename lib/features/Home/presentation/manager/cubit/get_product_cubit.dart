import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Home/data/repos/get_product_repo_implementaion.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit() : super(GetProductInitial());

  Future<void> getProduct() async {
    emit(GetProductLoading());
    final result = await GetProductRepoImplementaion().getProduct();
    result.fold(
      (failure) => emit(
        GetProductFailure(failure),
      ),
      (success) => emit(
        GetProductSuccess(success),
      ),
    );
  }
}
