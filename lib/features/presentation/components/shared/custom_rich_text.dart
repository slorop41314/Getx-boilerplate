part of 'shared.dart';

class CustomRichText extends StatelessWidget {
  final String first;
  final String second;
  final TextStyle? secondTextStyle;
  final TextStyle? firstTextStyle;
  const CustomRichText({
    required this.first,
    required this.second,
    this.secondTextStyle,
    this.firstTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: this.first,
          style: this.firstTextStyle,
        ),
        TextSpan(
          text: this.second,
          style: this.secondTextStyle,
        ),
      ],
    ));
  }
}
