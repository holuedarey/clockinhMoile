import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

const primaryColor = Color(0xFF059342);
const primaryLightColor = Color(0xFF61a13d);


bool isEmail(String email) {
  String p =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = RegExp(p);

  return regExp.hasMatch(email);
}

bool isPassword(String password) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(password);
}

// Spacing
double kPaddingForm = 2.h;
double kPaddingSmall = 3.h;
double kPadding = 5.h;
double kSmallPadding = 10.h;
double kRegularPadding = 15.h;
double kMediumPadding = 20.h;
double kExtraMediumPadding = 30.h;
double kLargePadding = 40.h;
double kFullPadding = 60.h;
double kFullPaddingSpacer = 50.h;
double kExtraFullPadding = 70.h;
double kExtraFullPaddingCard = 65.h;
double kExtraFullPaddingIndicator = 65.h;


double kFullPaddingOnboardingIndicator = 170.h;

double kWidthRatio = 0.9.h;
double kIconSize = 24.w;
double kCalculatedWidth(Size size) => size.width * kWidthRatio;
double kCalculatedMargin(Size size) => size.width * (1 - kWidthRatio) / 2;

// Colors
const kPrimaryColor = Color(0xFF059342);
const kSubAccColor = Color(0xFF749B06);
const kFundSubAccColor = Color(0xFFFFB629);
const kAccTransColor = Color(0xFF0287BF);
const kAccTopUpColor = Color(0xFF8206E5);
const Color kPrimaryTextColor = Color(0xFF4504C0);
const Color kTranPrimaryColor = Color(0xff7E8BB6);
const Color kSecondaryTextColor = Colors.white;
const Color kScaffoldBackgroundColor = Color(0xffffffff);
const Color kBorderColor = Color(0xff7E8BB6);
const Color? kSubtextColor = Color(0xff7E8BB6);
const Color kColorGrey = Color(0xfff4f4f4);
const Color kColorPink = Color(0xffF379C4);
const Color kColorBlue = Color(0xff6CD4FF);
const Color kColorBlack = Color(0xff1B2443);
const Color kColorYellow = Color(0xffFCEA6F);
const Color kColorYellowDeep = Color(0xffFCC70D);
const Color kColorOrange = Color(0xffFBAF52);
const Color kColorGreen = Color(0xff76DFC6);
const Color kColorDisabled = Color(0x88dadada);
const Color kColorGreyLight = Color(0xffF4F4F4);
const Color kTransButtonColor = Color(0x33D8CAF5);
const Color kGoalsColor = Color(0xffF2F3F8);
const Color kColorGreyII = Color(0xff979797);
const Color kColorGreyShade = Color(0xfffafafa);
const Color kColorGreyDisabled = Color(0xff6f7aa0);
const Color kColorSecondaryBlue3 = Color(0xff232d75);
const Color kColorPrimaryPurple3 = Color(0xff471672);
const Color kColorPrimaryPurple4 = Color(0xff1f053a);
const Color kColorSecondaryBlue2 = Color(0xffD7DAFF);
const Color kColorBak = Color(0xffe3d7ff);
const Color kPrimaryPurple1Color = Color(0xff6C33DB);
const Color kSecondaryBlue4 = Color(0xff040C35);
const Color kGreyShade = Color(0xffF7F8FA);

// Border
double kBorderWidth = 1;
const double kThickBorderWidth = 1;
BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(kPadding));
BorderRadius kFullBorderRadius = BorderRadius.all(Radius.circular(100.r));
BoxDecoration kTextFieldBoxDecoration = BoxDecoration(
    borderRadius: kBorderRadius, border: null, color: Colors.white);
BoxDecoration kRoundedEdgesBoxDecoration(Color backgroundColor,
    {double borderWidth = kThickBorderWidth,
      double radius = 10,
      Color borderColor = Colors.transparent,
      Color shadowColor = Colors.grey}) =>
    BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: Border.all(color: borderColor, width: borderWidth),
        boxShadow: [kBoxShadow(shadowColor)],
        color: backgroundColor);
final BoxDecoration kButtonBoxDecoration = BoxDecoration(
    borderRadius: kFullBorderRadius, border: Border.all(color: kPrimaryColor));
const BoxDecoration kBottomSheetBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  ),
);
BoxShadow kBoxShadow(Color color) => BoxShadow(
  color: color,
  spreadRadius: 0,
  blurRadius: 5,
  offset: Offset(0, 2), // changes position of shadow
);

// Text
TextStyle kHeadline1TextStyle = TextStyle(
  fontSize: 30.sp,
  fontWeight: FontWeight.bold,
  color: kPrimaryTextColor,
  fontFamily: "Poppins",
);
TextStyle kHeadline2TextStyle = TextStyle(
  fontSize: 24.sp,
  fontWeight: FontWeight.bold,
  fontFamily: "Poppins",
  color: kPrimaryTextColor,
);
TextStyle kHeadline3TextStyle = TextStyle(
  fontSize: 22.sp,
  fontWeight: FontWeight.w500,
  fontFamily: "Poppins",
  color: kPrimaryTextColor,
);
TextStyle kBodyText1Style = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.w500,
  fontFamily: "Poppins",
  color: kPrimaryTextColor,
);
TextStyle kBodyText2Style = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.normal,
  fontFamily: "Poppins",
  color: kPrimaryTextColor,
);
TextStyle kSubtitle1Style = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.normal,
  fontFamily: "Poppins",
  color: kSubtextColor,
);
TextStyle kSubtitle2Style = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w300,
  fontFamily: "Poppins",
  color: kSubtextColor,
);
String kPriceFormatter(num? price) {
  if (isEmpty(price.toString())) {
    return '\$  _';
  }
  if (price.toString().contains('-')) {
    String formattedPrice = price.toString().replaceAll("-", "");
    price = num.parse(formattedPrice);
    return ' -\$' + NumberFormat("#,##0.00", "en_US").format(price);
  } else {
    return ' \$' + NumberFormat("#,##0.00", "en_US").format(price);
  }
}

String kAmountFormatter(num? price) {
  if (isEmpty(price.toString())) {
    return '  _';
  }
  return NumberFormat("#,##0.00", "en_US").format(price);
}

String kTypeAmountFormatter(num? price) {
  return NumberFormat.compact().format(price);
}

String kAmountFormatterII(num? price) {
  return NumberFormat("#,##0", "en_US").format(price);
}

String _formatAmount(num amount, int decimalPlaces) {
  NumberFormat formatter = NumberFormat.decimalPattern('en');
  formatter.minimumFractionDigits = decimalPlaces;
  formatter.maximumFractionDigits = decimalPlaces;
  return formatter.format(amount);
}

String? formatAmountForCurrencyCode(num? amount, String? currencyCode) {
  if (amount == null || currencyCode == null) {
    return null;
  }
  // final currency = CurrencyManager.getCurrencyForCode(currencyCode);
  // if (currency == null) {
  //   return null;
  // }
  return _formatAmount(amount, 2);
}

List kBuilderName(String name) => name.split(' ');

bool isEmpty(String? s) => s == null || s == 'null' || s.trim().isEmpty;

// Theme
final ThemeData kThemeData = ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    dividerColor: kBorderColor,
    canvasColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: kScaffoldBackgroundColor,
      brightness: Brightness.light,
      elevation: 0,
      textTheme: TextTheme(
        headline1: kHeadline1TextStyle,
        headline2: kHeadline2TextStyle,
        headline3: kHeadline3TextStyle,
        bodyText1: kBodyText1Style,
        bodyText2: kBodyText2Style,
        subtitle1: kSubtitle1Style,
        subtitle2: kSubtitle2Style,
      ),
      iconTheme: IconThemeData(size: kIconSize, color: Color(0xff2C3E50)),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: IconThemeData(size: kIconSize),
    textTheme: TextTheme(
      headline1: kHeadline1TextStyle,
      headline2: kHeadline2TextStyle,
      headline3: kHeadline3TextStyle,
      bodyText1: kBodyText1Style,
      bodyText2: kBodyText2Style,
      subtitle1: kSubtitle1Style,
      subtitle2: kSubtitle2Style,
    ));

final ThemeData kThemeDataDark = ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    primaryColorDark: kPrimaryTextColor,
    primaryColorLight: kSecondaryTextColor,
    scaffoldBackgroundColor: Colors.grey[900],
    dividerColor: kBorderColor,
    canvasColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: kPrimaryTextColor,
      brightness: Brightness.dark,
      elevation: 0,
      textTheme: TextTheme(
        headline1: kHeadline1TextStyle.copyWith(color: Colors.white),
        headline2: kHeadline2TextStyle.copyWith(color: Colors.white),
        headline3: kHeadline3TextStyle.copyWith(color: Colors.white),
        bodyText1: kBodyText1Style.copyWith(color: Colors.white),
        bodyText2: kBodyText2Style.copyWith(color: Colors.white),
        subtitle1: kSubtitle1Style.copyWith(color: Colors.white),
        subtitle2: kSubtitle2Style.copyWith(color: Colors.white),
      ),
      iconTheme: IconThemeData(size: kIconSize, color: Color(0xff2C3E50)),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: IconThemeData(size: kIconSize),
    textTheme: TextTheme(
      headline1: kHeadline1TextStyle.copyWith(color: Colors.white),
      headline2: kHeadline2TextStyle.copyWith(color: Colors.white),
      headline3: kHeadline3TextStyle.copyWith(color: Colors.white),
      bodyText1: kBodyText1Style.copyWith(color: Colors.white),
      bodyText2: kBodyText2Style.copyWith(color: Colors.white),
      subtitle1: kSubtitle1Style.copyWith(color: Colors.white),
      subtitle2: kSubtitle2Style.copyWith(color: Colors.white),
    ));

