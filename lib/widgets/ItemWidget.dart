import 'package:flutter/material.dart';
import 'package:kt_nguyen_don_phuoc/models/product_model.dart';
import 'package:kt_nguyen_don_phuoc/pages/ItemPage.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({required this.item});

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemPage(item: item)));
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
          ),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xFF4C53A5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "-50%",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                )
              ],
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.network(
                  item.image.toString(),
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                item.title.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF4C53A5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                item.description.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$" + item.price.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                  Icon(
                    Icons.shopping_cart_checkout,
                    color: Color(0xFF4C53A5),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
