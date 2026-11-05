import 'package:flutter/material.dart';
import 'package:story_stack/presentation/core/style/colors.dart';

class AppTextStyles {
  static final titleTextStyle = TextStyle(color: AppColors.textColor, fontSize: 32);
  static final cardSubtitleTextStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16,
    fontFamily: 'ChakraPetch',
  );
  static final cardTitleTextStyle = TextStyle(color: AppColors.textColor, fontSize: 22);
  static final cardStatsTextStyle = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 16,
    fontFamily: 'ChakraPetch',
  );
  static final emptyStateTitleTextStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: 20,
    fontFamily: 'ChakraPetch',
    fontWeight: FontWeight.bold,
  );
  static final emptyStateSubtitleTextStyle = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 14,
    fontFamily: 'ChakraPetch',
  );
  static final errorLoadingMoreTextStyle = TextStyle(color: Colors.white, fontSize: 18);
}
