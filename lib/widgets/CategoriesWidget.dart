import 'dart:math';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:kt_nguyen_don_phuoc/provider/category_provider.dart';

class CategoriesWidget extends StatefulWidget {
  CategoriesWidget({required this.category, required this.setCategory});
  String category;
  final void Function(String cate) setCategory;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    var categories = Provider.of<CategoryProvider>(context);
    if (categories.list.isEmpty) {
      categories.getList();
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...categories.list.map((e) {
            return InkWell(
              onTap: () {
                widget.setCategory(e);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: widget.category == e ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        e.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
