part of 'shared.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 18.0,
    );
  }
}
