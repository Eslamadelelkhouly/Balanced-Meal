import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/container_info_bottom.dart';
import 'package:balancedmeal/features/Order%20Summary/presentation/manager/cubit/add_product_cubit.dart';
import 'package:balancedmeal/features/Order%20Summary/presentation/views/widgets/custom_list_view_card_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OrderSmmaryViewBody extends StatefulWidget {
  const OrderSmmaryViewBody({
    super.key,
    required this.cal,
    required this.sumsallary,
    required this.sumcal,
    required this.selectProduct,
  });

  final List<ProductItem> selectProduct;
  final String cal;
  final String sumsallary;
  final String sumcal;

  @override
  State<OrderSmmaryViewBody> createState() => _OrderSmmaryViewBodyState();
}

class _OrderSmmaryViewBodyState extends State<OrderSmmaryViewBody> {
  late List<ProductItem> selectedProducts;
  double totalCalories = 0;
  double totalSalary = 0;
  Map<String, dynamic> success = {};
  Map<String, dynamic> failuer = {};

  @override
  void initState() {
    super.initState();
    selectedProducts = widget.selectProduct;
    calculateTotals();
  }

  void calculateTotals() {
    double calSum = 0;
    double priceSum = 0;
    for (var product in selectedProducts) {
      calSum += product.calories * product.quantity;
      priceSum += product.totalPrice * product.quantity;
    }

    setState(() {
      totalCalories = calSum;
      totalSalary = priceSum;
    });
  }

  void onQuantityChangedCallback() {
    calculateTotals();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          success = state.response;
        } else if (state is AddProductFailure) {
          failuer = state.errorData;
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              ModalProgressHUD(
                  progressIndicator: const CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                  inAsyncCall: state is AddProductLoading,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.022),
                        CustomListViewCardOrderItem(
                          selectProdut: selectedProducts,
                          onQuantityChanged: onQuantityChangedCallback,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: double.infinity,
                  child: ContainerInfoBottom(
                    onpress: false,
                    titlebutton: 'Confirm',
                    cal: totalCalories.toStringAsFixed(1),
                    sumsallary: totalSalary.toStringAsFixed(2),
                    sumcal: totalCalories.toStringAsFixed(1),
                    selectProduct: selectedProducts,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
