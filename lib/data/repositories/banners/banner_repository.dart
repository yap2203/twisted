import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/banner_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async{
    try{
      final result = await _db.collection('Banners').where('Active' , isEqualTo: true).get();
      return result.docs.map((document) => BannerModel.fromSnapshot(document)).toList();
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on TPlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Upload Banners to the Cloud Firebase

}