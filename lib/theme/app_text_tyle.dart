import 'package:application/core/app_export.dart';

class AppStyle {
  //home screen styles
  static TextStyle homeWhite = const TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontStyle: FontStyle.italic,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle homeCardText = const TextStyle(
    color: AppColors.primary,
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
  );
  static TextStyle homeCardText2 = const TextStyle(
    color: AppColors.secondary,
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
  );
  static TextStyle homeCardText3 = const TextStyle(
    color: AppColors.primary,
    fontSize: 19,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
  );
  static TextStyle homeCardNumber = const TextStyle(
    color: AppColors.primary,
    fontSize: 30,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
  );
  static TextStyle homeCardSmall = const TextStyle(
    color: AppColors.secondary,
    fontSize: 15,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
  );

  static TextStyle inputText = const TextStyle(
    color: AppColors.primary,
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );
}
