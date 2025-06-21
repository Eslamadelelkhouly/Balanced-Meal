import 'dart:developer';

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

  final ValueNotifier<int> vegetablesNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> meatsNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> carbsNotifier = ValueNotifier<int>(0);

  final ValueNotifier<int> vegetablesCalories = ValueNotifier<int>(0);
  final ValueNotifier<int> meatsCalories = ValueNotifier<int>(0);
  final ValueNotifier<int> carbsCalories = ValueNotifier<int>(0);

  final ValueNotifier<int> totalAllSalariesNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> totalAllCaloriesNotifier = ValueNotifier<int>(0);

  List<ProductItem> selectedVegetables = [];
  List<ProductItem> selectedMeats = [];
  List<ProductItem> selectedCarbs = [];

  void updateTotals() {
    totalAllSalariesNotifier.value =
        vegetablesNotifier.value + meatsNotifier.value + carbsNotifier.value;
    totalAllCaloriesNotifier.value =
        vegetablesCalories.value + meatsCalories.value + carbsCalories.value;
  }

  String erroMessage = '';

  @override
  void initState() {
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
          progressIndicator: const CircularProgressIndicator(
            color: AppColor.orange,
          ),
          color: AppColor.orangelight,
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
                          onGroupChanged: (
                              {required salary, required calories}) {
                            vegetablesNotifier.value = salary;
                            vegetablesCalories.value = calories;
                            updateTotals();
                          },
                          onSelectedProductsChanged: (products) {
                            selectedVegetables = products;
                          },
                        ),
                        const SizedBox(height: 24),
                        CustomListView(
                          title: 'Meats',
                          productitem: productCategoryModel.meats,
                          onGroupChanged: (
                              {required salary, required calories}) {
                            meatsNotifier.value = salary;
                            meatsCalories.value = calories;
                            updateTotals();
                          },
                          onSelectedProductsChanged: (products) {
                            selectedMeats = products;
                          },
                        ),
                        const SizedBox(height: 24),
                        CustomListView(
                          title: 'Carbs',
                          productitem: productCategoryModel.carbs,
                          onGroupChanged: (
                              {required salary, required calories}) {
                            carbsNotifier.value = salary;
                            carbsCalories.value = calories;
                            updateTotals();
                          },
                          onSelectedProductsChanged: (products) {
                            selectedCarbs = products;
                          },
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                ValueListenableBuilder<int>(
                  valueListenable: totalAllSalariesNotifier,
                  builder: (context, totalSalary, _) {
                    return ValueListenableBuilder<int>(
                      valueListenable: totalAllCaloriesNotifier,
                      builder: (context, totalCalories, _) {
                        final allSelectedProducts = [
                          ...selectedVegetables,
                          ...selectedMeats,
                          ...selectedCarbs
                        ];
                        log('allSelectedProducts: ${allSelectedProducts.toString()}');
                        return Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ContainerInfoBottom(
                            onpress: true,
                            titlebutton: 'Place order',
                            selectProduct: allSelectedProducts,
                            cal: widget.cal.toInt().toString(),
                            sumsallary: totalSalary.toString(),
                            sumcal: totalCalories.toString(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
