import 'package:flutter/material.dart';
import 'package:kt_nguyen_don_phuoc/widgets/CartAppBar.dart';
import 'package:kt_nguyen_don_phuoc/widgets/CartItem.dart';
import 'package:kt_nguyen_don_phuoc/widgets/CartBottomNavBar.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: ListView(
          children: [
            CartAppBar(),
            Container(
              height: 700,
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
              ),
              child: Column(
                children: [
                  CartItem(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF4C53A5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Add Coupon Code",
                            style: TextStyle(
                                color: Color(0xFF4C53A5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: CartBottomNavBar(),
      ),
    );
  }
}
