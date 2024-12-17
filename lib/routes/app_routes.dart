
import 'package:Twisted/features/authentication/screens/home/home.dart';
import 'package:Twisted/features/authentication/screens/login/login.dart';
import 'package:Twisted/features/authentication/screens/signup/signup.dart';
import 'package:Twisted/features/authentication/screens/signup/verify_email.dart';
import 'package:Twisted/features/personalization/screens/profile/profile.dart';
import 'package:Twisted/features/personalization/screens/settings/settings.dart';
import 'package:Twisted/features/shop/screens/store/store.dart';
import 'package:Twisted/routes/routes.dart';
import 'package:get/get.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';

class AppRoutes{
  static final pages=[
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    // GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    // GetPage(name: TRoutes.productReviews, page: () => const ProductReviewScreen()),
    // GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    // GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    // GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    // GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    // GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),




  ];
}