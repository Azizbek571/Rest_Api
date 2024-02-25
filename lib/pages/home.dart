import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/models/product.dart';
import 'package:rest_api/stores/home_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController controller = Get.put(HomeController());
  ScrollController scrollController =ScrollController();



  

  // @override
  // void initState() {
  //   scrollController.addListener(() { 
  //     if(scrollController.position.atEdge){
  //       bool isTop = scrollController.position.pixels==0;
  //       if(!isTop){
  //         print('object');
  //       }
  //     }
  //   });
  //   // controller.fetchProducts();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Main page'),
            ),
            body: ListView(
            controller: scrollController,
              children: List.generate(controller.products.length, (index) {
                var item = controller.products[index];
                return ProductCard(product: item);
              }),
            ));
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.product});
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: product.thumbnail,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              

                Text(
                  product.category,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
            const SizedBox(height: 10),

                Text(
                  product.price.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
