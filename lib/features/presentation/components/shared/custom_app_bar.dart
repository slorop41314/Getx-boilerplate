part of 'shared.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  final String title;

  final Widget? leading;
  final List<Widget>? trailing;

  CustomAppBar(
    this.title, {
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title.toUpperCase(),
        style: headerTextStyle,
      ),
      // centerTitle: true,
      backgroundColor: Colors.white,
      leading: leading,
      actions: trailing,
    );
  }
}
