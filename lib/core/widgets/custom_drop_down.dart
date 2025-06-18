import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.hinttext,
    required this.dropdowntext1,
    required this.dropdowntext2,
    required this.text,
    required this.width,
    this.onChanged,
  });

  final String hinttext, dropdowntext1, dropdowntext2, text;
  final double width;
  final ValueChanged<String?>? onChanged;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue;
  late final List<String> items;

  @override
  void initState() {
    super.initState();
    items = [widget.dropdowntext1, widget.dropdowntext2];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffEAECF0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffEAECF0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffEAECF0)),
              ),
            ),
            hint: Text(
              widget.hinttext,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            items: items.map((item) {
              final bool isSelectedItem = selectedValue == item;
              return DropdownMenuItem<String>(
                value: item,
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    color: isSelectedItem
                        ? AppColor.orangelight
                        : Colors.transparent,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: isSelectedItem
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        if (isSelectedItem)
                          const Icon(Icons.check,
                              color: Colors.orange, size: 18),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
            selectedItemBuilder: (context) {
              return items.map((item) {
                return Text(
                  item,
                  style: const TextStyle(color: Colors.black),
                );
              }).toList();
            },
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your ${widget.text}';
              }
              return null;
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 52,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 4,
              offset: const Offset(0, 8),
              padding: EdgeInsets.zero,
              maxHeight: 200,
            ),
          ),
        ],
      ),
    );
  }
}
