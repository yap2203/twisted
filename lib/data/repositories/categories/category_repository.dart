import 'package:Twisted/features/shop/models/category_model.dart';
import 'package:Twisted/utils/service/cloudinary_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async{
    try{
    final snapshot = await _db.collection('Categories').get();
    final list = snapshot.docs.map((document) => CategoryModel.fromSnapShot(document)).toList();
    return list;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on TPlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong. Please try again!';
    }
  }

  ///Upload Categories to cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = TCloudinaryStorageService.instance;

      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);

        final url =
            await storage.uploadImageData('Categories', file, category.name);

        category.image = url;

        await _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
      }
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }
}
