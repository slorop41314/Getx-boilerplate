part of 'shared.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> list;
  final dynamic value;

  final void Function(T value)? onSelectPicker;
  CustomDropdown({
    required this.list,
    required this.value,
    this.onSelectPicker,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<T>(
          style: Theme.of(context).textTheme.bodyText1,
          underline: SizedBox(),
          isExpanded: true,
          value: this.value,
          items: list,
          onChanged: (newVal) {
            if (newVal != null && this.onSelectPicker != null) {
              this.onSelectPicker!(newVal);
            }
          }),
    );
  }
}
