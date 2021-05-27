import 'package:flutter/material.dart';
import 'package:getx_boilerplate/features/presentation/components/shared/shared.dart';
import 'package:getx_boilerplate/features/presentation/utils/asset_path.dart';

class AppLogo extends StatelessWidget {
  final double imageSize;
  final double fontSize;
  const AppLogo({
    Key? key,
    this.imageSize = 100,
    this.fontSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Column(
            children: [
              Image.asset(
                logoImage,
                width: this.imageSize,
                height: this.imageSize,
                fit: BoxFit.cover,
              ),
              CustomRichText(
                first: "App",
                second: "Name",
                firstTextStyle: TextStyle(
                  fontSize: this.fontSize,
                  color: Colors.red,
                ),
                secondTextStyle: TextStyle(
                  fontSize: this.fontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
