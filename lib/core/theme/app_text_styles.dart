import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTextStyles {

  static final String _fontFamily = GoogleFonts.cairo().fontFamily!;
  static TextStyle get titleLarge =>
     TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.bold
  );
  static TextStyle get titleMedium =>
     TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.bold
  );

  static TextStyle get titleSmall =>
     TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.bold
  );

  static TextStyle get bodyLarge =>
     TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      color: Colors.black,
      
  );
  static TextStyle get bodyMedium =>
     TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      color: Colors.black,
      
  );
  static TextStyle get bodySmall =>
     TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      color: Colors.black,
      
  );
}
      