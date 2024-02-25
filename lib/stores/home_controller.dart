 import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rest_api/models/product.dart';

class HomeController extends GetxController{
  Dio dio = Dio();
  bool loading = false;

  @override
  void onInit() {
    fetchProducts();
    createProduct();
    super.onInit();
  }

  // https://dummyjson.com/products
  List<ProductModel> products = [];
 Future<void> fetchProducts()async{
  try{
  loading=true;
  update();
  var res = await dio.get('https://dummyjson.com/products');
  products=getListFromMap(res.data['products']);
  print(products[0].title);

  }catch(err){
     print(err);
  }finally{
    loading=false;
    update();
  }
 }


 Future<void> createProduct()async{
  try{
  loading=true;
  update();
  var res = await dio.post('https://dummyjson.com/products/add', data:{
    'title': 'Rambo'
  });
  print(res);

  }catch(err){
     print(err);
  }finally{
    loading=false;
    update();
  }
 }


}




// https://dummyjson.com/products/add