import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/products.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  //// final Function press;

  const ItemCard({
    Key? key,
    required this.product,
    //required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: press(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Padding(padding: EdgeInsets.all(20)),
          Expanded(
              child: Container(
            // margin: EdgeInsets.all(2),
            // For  demo we use fixed height  and width
            // Now we dont need them
            // height: 180,
            // width: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                color: Colors.black54),

            child: Hero(
              tag: "${product.id}",
              child: Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(product.image), fit: BoxFit.fill),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                // child: Image.asset(product.image),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
          Text(
            "${product.price}€",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
