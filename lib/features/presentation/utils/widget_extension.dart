part of 'common.dart';

extension WidgetUtils on Widget {
  Padding padding(EdgeInsets padding) => Padding(
        padding: padding,
        child: this,
      );

  Padding paddingPoints({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          bottom: bottom,
          right: right,
        ),
        child: this,
      );
  Expanded expanded([int flex = 1]) => Expanded(
        child: this,
        flex: flex,
      );

  Container coloredRoundedContainer(Color color, [double padding = 16]) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: this,
      );

  Container sectionContainer([double padding = 16]) => Container(
        padding: EdgeInsets.all(padding),
        color: Colors.white,
        child: this,
      );

  Container bottomActionContainer() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            spreadRadius: 3,
            offset: Offset(0, 1),
          ),
        ]),
        child: this,
      );

  Container bottomSheetContainer() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: this,
      );
}
