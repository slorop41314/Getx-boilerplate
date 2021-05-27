part of 'shared.dart';

class CustomButtonIcon extends StatelessWidget {
  final IconData iconName;
  final String label;
  final void Function() onPressed;
  final Color buttonColor;
  final Color textColor;
  final bool isDisabled;
  final bool isLoading;

  const CustomButtonIcon({
    required this.iconName,
    required this.label,
    required this.onPressed,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: this.buttonColor,
      ),
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: ElevatedButton.icon(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              color: textColor,
            ),
          ),
        ),
        // disabledColor: Colors.grey,
        onPressed: this.isLoading
            ? null
            : this.isDisabled
                ? null
                : this.onPressed,
        icon: Icon(this.iconName),
        label: this.isLoading ? LoadingIndicator() : Text(this.label),
      ),
    );
  }
}
