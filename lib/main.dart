import 'package:flutter/material.dart';
import 'package:kt_nguyen_don_phuoc/pages/CartPage.dart';
import 'package:kt_nguyen_don_phuoc/pages/HomePage.dart';
import 'package:kt_nguyen_don_phuoc/pages/ItemPage.dart';
import 'package:kt_nguyen_don_phuoc/provider/product_provider.dart';
import 'package:kt_nguyen_don_phuoc/provider/category_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: HomePage(),
      ),
    );
  }
}
