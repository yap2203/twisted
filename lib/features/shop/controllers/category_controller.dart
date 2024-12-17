import 'dart:convert';

import 'package:Twisted/data/repositories/categories/category_repository.dart';
import 'package:Twisted/features/shop/models/category_model.dart';
import 'package:Twisted/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;



  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load category data
  Future<void> fetchCategories() async{
    try{

      //Show Loader
      isLoading.value = true;

      //Fetch Categories
      final categories = await _categoryRepository.getAllCategories();

      //Update categories
      allCategories.assignAll(categories);

      //Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!' , message: e.toString());
    }finally{
isLoading.value=false;
    }

}


  /// -- Load selected category data



  ///  get category or sub-category products


}