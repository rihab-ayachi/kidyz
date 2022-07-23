import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/products.dart';
import 'package:flutter_application_1/view/colis.dart';
import 'package:flutter_application_1/view/detail_shopping.dart';

class ItemShopping extends StatelessWidget {
  final Product item;

  const ItemShopping({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailShopping(
              item: item,
            ),
          ));
        },
        leading: Image.asset(item.image),
        trailing: Icon(
          Icons.play_arrow_sharp,
          color: Colors.black38,
        ),
      ),
    );
  }
}
