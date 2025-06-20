// ✅ CustomListView.dart
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
  });

  final List<ProductItem> productitem;
  final String title;
  final void Function({required int salary, required int calories}) onGroupChanged;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final ValueNotifier<int> totalSalaryNotifier = ValueNotifier<int>(0);
  final Map<int, int> salaryMap = {};
  final Map<int, int> caloriesMap = {};

  void updateSalary(int index, int newSalary, int newCalories) {
    salaryMap[index] = newSalary;
    caloriesMap[index] = newCalories;

    final totalSalary = salaryMap.values.fold(0, (sum, val) => sum + val);
    final totalCalories = caloriesMap.values.fold(0, (sum, val) => sum + val);

    totalSalaryNotifier.value = totalSalary;
    widget.onGroupChanged(salary: totalSalary, calories: totalCalories);
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
        ValueListenableBuilder<int>(
          valueListenable: totalSalaryNotifier,
          builder: (context, value, _) {
            return Text('Total Salary: \$${value}');
          },
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
                  onTotalSalaryChanged: (newSalary, newCalories) =>
                      updateSalary(index, newSalary, newCalories),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
