import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/card_item.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({
    super.key,
    required this.productitem,
    required this.title,
    required this.onGroupChanged,
    required this.onSelectedProductsChanged,
  });

  final List<ProductItem> productitem;
  final String title;
  final void Function({required int salary, required int calories})
      onGroupChanged;
  final void Function(List<ProductItem>) onSelectedProductsChanged;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final ValueNotifier<int> totalSalaryNotifier = ValueNotifier<int>(0);
  final Map<int, int> salaryMap = {};
  final Map<int, int> caloriesMap = {};
  final Map<int, int> quantityMap = {};

  void updateSalary(int index, int newSalary, int newCalories, int quantity) {
    salaryMap[index] = newSalary;
    caloriesMap[index] = newCalories;
    quantityMap[index] = quantity;

    final totalSalary = salaryMap.values.fold(0, (sum, val) => sum + val);
    final totalCalories = caloriesMap.values.fold(0, (sum, val) => sum + val);

    totalSalaryNotifier.value = totalSalary;
    widget.onGroupChanged(salary: totalSalary, calories: totalCalories);

    final selectedProducts = <ProductItem>[];
    for (final entry in quantityMap.entries) {
      if (entry.value > 0) {
        final product = widget.productitem[entry.key];
        selectedProducts.add(
          ProductItem(
            foodName: product.foodName,
            quantity: entry.value,
            totalPrice: product.totalPrice,
            imageUrl: product.imageUrl,
            calories: product.calories,
          ),
        );
      }
    }
    widget.onSelectedProductsChanged(selectedProducts);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppStyle.textStyleregular20poppins.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        if (widget.productitem.isEmpty)
          const Center(child: Text('', style: TextStyle(color: Colors.grey)))
        else
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.productitem.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CardItem(
                  urlimg: widget.productitem[index].imageUrl,
                  title: widget.productitem[index].foodName,
                  cal: widget.productitem[index].calories.toString(),
                  salary: widget.productitem[index].totalPrice.toString(),
                  onTotalSalaryChanged: (newSalary, newCalories, quantity) =>
                      updateSalary(index, newSalary, newCalories, quantity),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
