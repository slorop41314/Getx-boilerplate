part of 'common.dart';

extension TextStyling on TextStyle {
  TextStyle get grey => this.copyWith(
        color: AppColors.greyText,
      );
  TextStyle get red => this.copyWith(
        color: AppColors.red,
      );
  TextStyle get primary => this.copyWith(
        color: AppColors.primary,
      );
  TextStyle get secondary => this.copyWith(
        color: AppColors.secondary,
      );
  TextStyle get green => this.copyWith(
        color: AppColors.green,
      );
  TextStyle get orange => this.copyWith(
        color: AppColors.orangeText,
      );
  TextStyle get light => this.copyWith(
        color: Colors.white,
      );
}
