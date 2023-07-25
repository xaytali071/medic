import 'package:flutter_remix/flutter_remix.dart';

class AppConstants {
  AppConstants._();

  /// social sign-in
  static const socialSignIn = [
    FlutterRemix.google_fill,
    FlutterRemix.facebook_fill,
    FlutterRemix.apple_fill,
  ];
  static const String signInPassword = "1232";

  /// location
  static const double demoLatitude = 41.304223;
  static const double demoLongitude = 69.2348277;
  static const double pinLoadingMin = 0.116666667;
  static const double pinLoadingMax = 0.611111111;

  ///refresh duration
  static const Duration timeRefresh = Duration(seconds: 30);

  /// shared preferences keys
  static const String keyToken = 'keyTokenGM';
  static const String keyUser = 'keyUserGM';
  static const String keyProductLike = 'keyProductLikeGM';
  static const String keyShopLike = 'keyShopLikeGM';
  static const String keySocialLike = 'keySocialLikeGM';
  static const String keyMessage = 'keyMessageGM';
  static const String keyCard = 'keyCardGM';
  static const String keyCartCounts = 'keyCartCountsGM';
  static const String keyBank = 'keyBankGM';
}
