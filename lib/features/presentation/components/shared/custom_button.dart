part of 'shared.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final bool isDisabled;
  final bool isLoading;
  final void Function() onPressed;
  final CustomButtonSize buttonSize;
  final CustomButtonType buttonType;

  CustomButton({
    required this.label,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
    this.buttonSize = CustomButtonSize.main,
    this.buttonType = CustomButtonType.primary,
  });

  Widget build(BuildContext context) {
    final _isDisabled = (isDisabled || isLoading);
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(buttonSize.padding),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed))
              return buttonType.color.withOpacity(0.7);
            else if (!isLoading && states.contains(MaterialState.disabled))
              return Colors.grey;
            return buttonType.color;
          },
        ),
        elevation: MaterialStateProperty.resolveWith<double>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed))
              return 1;
            else if (states.contains(MaterialState.disabled)) return 0;
            return .5;
          },
        ),
        splashFactory: InkRipple.splashFactory,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonSize.borderRadius),
            side: BorderSide(
              color: buttonType.borderColor ?? Colors.transparent,
            ),
          ),
        ),
      ),
      onPressed: _isDisabled
          ? null
          : this.isLoading
              ? null
              : this.onPressed,
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          child: Center(
            child: this.isLoading
                ? LoadingIndicator()
                : Text(
                    this.label,
                    textAlign: TextAlign.center,
                    style: buttonSize.fontStyle.copyWith(
                      fontSize: buttonSize.fontSize,
                      color: buttonType.fontColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

enum CustomButtonType {
  primary,
  secondary,
}

enum CustomButtonSize {
  main,
  medium,
  small,
}

extension CustomButtonTypeExtension on CustomButtonType {
  Color get color {
    switch (this) {
      case CustomButtonType.primary:
        return AppColors.primary;
      case CustomButtonType.secondary:
        return Colors.white;
    }
  }

  Color? get borderColor {
    switch (this) {
      case CustomButtonType.secondary:
        return AppColors.primary;
      case CustomButtonType.primary:
      default:
        return null;
    }
  }

  Color? get fontColor {
    switch (this) {
      case CustomButtonType.secondary:
        return AppColors.primary;
      case CustomButtonType.primary:
      default:
        return Colors.white;
    }
  }
}

extension CustomButtonSizeExtension on CustomButtonSize {
  TextStyle get fontStyle {
    switch (this) {
      case CustomButtonSize.small:
      case CustomButtonSize.main:
      case CustomButtonSize.medium:
      default:
        return CustomTextStyles.extraBold14.light;
    }
  }

  double get fontSize {
    switch (this) {
      case CustomButtonSize.main:
        return 14;
      case CustomButtonSize.medium:
        return 12;
      case CustomButtonSize.small:
        return 12;
    }
  }

  // double get height {
  //   switch (this) {
  //     case CustomButtonSize.main:
  //       return 52;
  //     case CustomButtonSize.medium:
  //       return 30;
  //     case CustomButtonSize.small:
  //       return 39;
  //   }
  // }

  double get borderRadius {
    switch (this) {
      case CustomButtonSize.main:
        return 8;
      case CustomButtonSize.medium:
        return 4;
      case CustomButtonSize.small:
        return 8;
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case CustomButtonSize.main:
        return const EdgeInsets.symmetric(
          vertical: 16,
        );
      case CustomButtonSize.medium:
        return EdgeInsets.zero;
      case CustomButtonSize.small:
        return const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 18,
        );
      default:
        return EdgeInsets.zero;
    }
  }
}
