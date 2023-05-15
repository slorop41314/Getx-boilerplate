part of 'shared.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> list;
  final dynamic value;
  final String label;

  final void Function(T value)? onSelectPicker;
  CustomDropdown({
    required this.list,
    required this.value,
    required this.label,
    this.onSelectPicker,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: CustomTextStyles.semibold14,
        ),
        Container(
          height: 36,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
          child: DropdownButton<T>(
              style: CustomTextStyles.regular14,
              underline: const SizedBox(),
              isExpanded: true,
              value: this.value,
              items: list,
              onChanged: (newVal) {
                if (newVal != null && this.onSelectPicker != null) {
                  this.onSelectPicker!(newVal);
                }
              }),
        ),
      ],
    );
  }
}
