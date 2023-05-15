part of 'shared.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

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
        style: CustomTextStyles.semibold16,
      ),
      // centerTitle: true,
      backgroundColor: Colors.white,
      leading: leading,
      actions: trailing,
    );
  }
}
