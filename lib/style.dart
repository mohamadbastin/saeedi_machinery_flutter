import 'package:flutter/material.dart';

import 'models/product.dart';

const LargeTextSize = 28.0;
const MediumTextSize = 21.0;
const SmallTextSize = 16.0;

const Color MyOrange = Color(0xFFFF8F2E);
const Color MyDarkOrange = Color(0xFFE87512);
const Color MyWhite = Color(0xFFFFFFFF);
const Color MyLightGray = Color(0xFFF0F0F0);
const Color MySemiLightGray = Color(0xFFCFCFCF);
const Color MyGray = Color(0xFF868686);
const Color MyDarkGray = Color(0xFF505050);
const Color MyBlack = Color(0xFF343434);

Future<List> FeaturedLocal;

const String FontNameDefault = "Poppins";

const MedWhiteLightText = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: MediumTextSize,
  color: Colors.white,
);