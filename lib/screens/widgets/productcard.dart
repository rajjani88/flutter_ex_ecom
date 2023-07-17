import 'package:flutter/material.dart';
import 'package:flutter_ex_ecom/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel? pm;
  const ProductCard({super.key, required this.pm});

  @override
  Widget build(BuildContext context) {
    return pm == null
        ? Container(
            child: Column(
              children: [Text('No Data Found')],
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                //image
                SizedBox(
                  height: 300,
                  child: Image.network(pm!.image),
                ),
                const SizedBox(
                  height: 18,
                ),

                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Wrap(
                    children: [
                      Text(
                        '${pm?.title}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Wrap(
                    children: [
                      Text(
                        '${pm?.description}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: ElevatedButton(
                      onPressed: () {}, child: Text('Buy Now \$ ${pm?.price}')),
                )
              ],
            ),
          );
  }
}
