import 'package:flutter/cupertino.dart';

import '../network/local/cache_helper.dart';
import 'components.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);
const kSecondColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimatedDuration = Duration(microseconds: 200);

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      //TODO add LOGIN SCREEN
      navigateAndFinish(context, null);
    }
  });
}

String token = '';