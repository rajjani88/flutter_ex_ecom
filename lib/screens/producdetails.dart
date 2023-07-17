import 'package:flutter/material.dart';
import 'package:flutter_ex_ecom/models/product_model.dart';
import 'package:flutter_ex_ecom/repository/homerepo.dart';
import 'package:flutter_ex_ecom/screens/widgets/productcard.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductModel? pm;
  bool isLoading = false;
  Future<ProductModel?>? pmFuture;

  callApi() {
    setState(() {
      isLoading = true;
    });
    HomeRepo().getData().then((value) {
      setState(() {
        pm = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        pm = null;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    pmFuture = HomeRepo().getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Row(
              children: [
                BackButton(),
              ],
            ),
            FutureBuilder(
                future: pmFuture,
                builder: (context, AsyncSnapshot<ProductModel?> snapshot) {
                  if (!snapshot.hasData) {
                    const Card(
                        child: Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ),
                    ));
                  }
                  pm = snapshot.data;
                  return ProductCard(pm: pm);
                }),
          ],
        ),
      ),
    );
  }
}
