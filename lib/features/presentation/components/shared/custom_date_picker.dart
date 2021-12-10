part of 'shared.dart';

class CustomDatePicker extends StatelessWidget {
  final String? label;
  final String? value;
  final String? placeholder;
  final void Function(String value)? onDateSelected;
  final bool isRequired;
  final String format;

  CustomDatePicker({
    this.label,
    @required this.value,
    this.placeholder = "Choose date",
    this.onDateSelected,
    this.isRequired = false,
    this.format = "dd MMM yyyy",
  });

  void _openDatePicker(BuildContext context) async {
    var result = await showDatePicker(
      context: context,
      initialDate:
          this.value != null ? Jiffy(value, format).dateTime : DateTime.now(),
      firstDate: Jiffy().subtract(months: 6).dateTime,
      lastDate: Jiffy().add(months: 6).dateTime,
    );
    if (result != null && this.onDateSelected != null) {
      this.onDateSelected!(Jiffy(result).format(this.format));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this.label != null ? Text(this.label!) : SizedBox(),
        TextButton(
          onPressed: onDateSelected != null
              ? () {
                  _openDatePicker(context);
                }
              : null,
          child: Container(
            margin: EdgeInsets.only(top: 4),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.grey[300]!,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  this.value != null
                      ? Text(
                          this.value!,
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      : Text(this.placeholder ?? "Choose date",
                          style: Theme.of(context).textTheme.caption),
                  this.onDateSelected != null
                      ? Icon(
                          Icons.date_range_outlined,
                          // color: AppColors.primary,
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
