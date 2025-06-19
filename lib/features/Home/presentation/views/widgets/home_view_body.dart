import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Home/presentation/manager/cubit/get_product_cubit.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/container_info_bottom.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key, required this.cal});
  final double cal;
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  ProductCategoryModel productCategoryModel = ProductCategoryModel(
    carbs: [],
    vegetables: [],
    meats: [],
  );
  String erroMessage = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetProductCubit>().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProductCubit, GetProductState>(
      listener: (context, state) {
        if (state is GetProductSuccess) {
          productCategoryModel = state.productCategoryModel;
        }
        if (state is GetProductFailure) {
          erroMessage = state.errorMessage;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: AppColor.orange,
          inAsyncCall: state is GetProductLoading,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 150),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        CustomListView(
                          title: 'Vegetables',
                          productitem: productCategoryModel.vegetables,
                        ),
                        const SizedBox(height: 24),
                        CustomListView(
                          productitem: productCategoryModel.meats,
                          title: 'Meats',
                        ),
                        const SizedBox(height: 24),
                        CustomListView(
                          productitem: productCategoryModel.carbs,
                          title: 'Carbs',
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ContainerInfoBottom(
                    cal: widget.cal.toInt().toString(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
