import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  /// Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// GetX Local Storage
  await GetStorage.init();

  /// await Splash Screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
//
WidgetsFlutterBinding.ensureInitialized();
await dotenv.load(fileName: ".env");
//
  runApp(const App());
}


// // TEST UPLOAD FILE TO CLOUDINARY
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       routes: {
//         "/": (context) => HomePage(),
//         "/upload" : (context) => UploadArea()
//
//       },
//     );
//   }
// }
