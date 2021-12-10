part of 'shared.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final bool isDisabled;
  final bool isLoading;
  final void Function() onPressed;
  final Color buttonColor;
  final Color labelColor;
  final double labelSize;
  final double height;
  final EdgeInsets? padding;
  final Color? borderColor;
  final double borderRadius;

  CustomButton({
    required this.label,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
    this.buttonColor = AppColors.primary,
    this.labelColor = Colors.white,
    this.labelSize = 14,
    this.height = 44,
    this.padding,
    this.borderColor,
    this.borderRadius = 8,
  });

  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(this.padding),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed))
              return this.buttonColor.withOpacity(0.5);
            else if (states.contains(MaterialState.disabled))
              return this.buttonColor.withOpacity(0.2);
            return this.buttonColor;
          },
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: this.borderColor ?? Colors.transparent),
          ),
        ),
      ),
      onPressed: this.isDisabled
          ? null
          : this.isLoading
              ? null
              : this.onPressed,
      child: Container(
        width: double.infinity,
        height: this.height,
        child: Center(
          child: this.isLoading
              ? LoadingIndicator()
              : Text(
                  this.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: this.labelColor,
                    fontSize: this.labelSize,
                  ),
                ),
        ),
      ),
    );
  }
}
