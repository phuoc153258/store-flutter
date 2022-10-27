import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:kt_nguyen_don_phuoc/widgets/HomeAppBar.dart';
import 'package:kt_nguyen_don_phuoc/widgets/CategoriesWidget.dart';
import 'package:kt_nguyen_don_phuoc/widgets/ItemWidget.dart';
import 'package:provider/provider.dart';
import 'package:kt_nguyen_don_phuoc/provider/product_provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String category = "";
  String keyword = "";

  @override
  void initState() {
    super.initState();
    category = "All";
    keyword = "";
    var productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.getList(
      category,
      keyword,
    );
  }

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    void setCategory(String cate) {
      setState(() {
        category = cate;
        productProvider.getList(
          cate,
          keyword,
        );
      });
    }

    return Scaffold(
      body: ListView(children: [
        HomeAppBar(),
        Container(
          // height: 500,
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )),
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 50,
                    width: 300,
                    child: TextField(
                      onSubmitted: (content) async {
                        if (content != "") {
                          setState(() {
                            keyword = content;
                            productProvider.getList(
                              category,
                              content,
                            );
                          });
                        } else {
                          setState(() {
                            keyword = "";
                            productProvider.getList(
                              category,
                              "",
                            );
                          });
                        }
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here ..."),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                    size: 25,
                    color: Color(0xFF4C53A5),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                "Categories",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5)),
              ),
            ),
            CategoriesWidget(category: category, setCategory: setCategory),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                "Best Selling",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ),
            GridView.count(
              childAspectRatio: 0.7,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                ...productProvider.list.map((e) {
                  return ItemWidget(item: e);
                }).toList()
              ],
            )
          ]),
        )
      ]),
    );
  }

  void searchProduct(String query) {
    developer.log("logger" + query);
  }
}
