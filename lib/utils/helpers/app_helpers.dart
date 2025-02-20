import 'package:flutter/material.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';

class AppHelpers {
  AppHelpers._();

  // img string provider
  static String handleImgString(String value) {
    switch(value) {
      case FAppText.startUps:
        return FAppImg.startUp;
      case FAppText.chinese:
        return FAppImg.chinese;
      case FAppText.beverages:
        return FAppImg.beveragesImg;
      case FAppText.northIndian:
        return FAppImg.northIndian;
      case FAppText.southIndian:
        return FAppImg.southIndian;
      default:
        return FAppImg.saladImg;
    }
  }

  // food type color provider
  static Color handleFoodTypeColor(String value, String description) {
    // Combine title and description for comprehensive analysis
    String combinedText = ("$value $description").toLowerCase();

    // Regular expressions for non-veg and veg keywords
    RegExp nonVegRegex = RegExp(r"(chicken|beef|lamb|goat|pork|fish|seafood|meat|non-veg)");
    RegExp vegRegex = RegExp(r"(veg|vegetarian|vegan)");

    // Check for non-vegetarian keywords
    if (nonVegRegex.hasMatch(combinedText)) {
      return Colors.red;
    }

    // Check for vegetarian keywords
    if (vegRegex.hasMatch(combinedText)) {
      return Colors.green;
    }

    // Default to a neutral color (e.g., grey) if neither veg nor non-veg is found
    return Colors.grey;
  }
}