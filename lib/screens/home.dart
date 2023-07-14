import 'package:flutter/material.dart';
import 'package:flutter_ex_ecom/models/product_model.dart';
import 'package:flutter_ex_ecom/repository/homerepo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductModel? pm;
  bool isLoading = false;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecom App'),
      ),
      body: Column(
        children: [
          isLoading
              ? Card(
                  child: Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                ))
              : pm == null
                  ? const Card(
                      child: Center(
                      child: ListTile(
                        title: Text('No product Found !'),
                        leading: SizedBox(
                          height: 100,
                          width: 100,
                          child: Icon(Icons.close),
                        ),
                      ),
                    ))
                  : Card(
                      child: ListTile(
                        title: Text('${pm?.title}'),
                        subtitle: Text('${pm?.description}'),
                        leading: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(pm!.image),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {},
                          child: Text('Buy Now ${pm?.price}'),
                        ),
                      ),
                    ),
          ElevatedButton(
              onPressed: () {
                callApi();
              },
              child: Text('Call APi'))
        ],
      ),
    );
  }
}
