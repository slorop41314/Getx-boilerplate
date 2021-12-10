import 'package:flutter/material.dart';
import 'package:getx_boilerplate/features/presentation/utils/common.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.rubik().toString(),
    appBarTheme: AppBarTheme(
      // color: Colors.black,
      elevation: 1,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    // iconTheme: IconThemeData(
    //   color: Colors.black,
    // ),
    primaryColor: AppColors.primary,
    hintColor: Color(0xffcdd3e0),
    dividerColor: Colors.grey[100],
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      button: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: AppColors.border,
      )),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: AppColors.border,
      )),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: AppColors.primary.withOpacity(0.5),
      )),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.red.withOpacity(0.5),
      )),
      labelStyle: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Color(0xffEBECED),
      thickness: 1,
      space: 1,
    ),
  );
}
