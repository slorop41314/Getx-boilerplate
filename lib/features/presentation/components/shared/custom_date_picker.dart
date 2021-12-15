part of 'shared.dart';

class CustomDatePicker extends StatelessWidget {
  final String? label;
  final DateTime? value;
  final String placeholder;
  final void Function(DateTime value)? onDateSelected;
  final bool isRequired;
  final String? format;
  final DateTime? lastDate;
  final DateTime? firstDate;
  final DateTime? initialDate;
  final bool onlyBottomBorder;
  CustomDatePicker({
    this.label,
    required this.value,
    this.placeholder = "Choose date",
    this.onDateSelected,
    this.isRequired = false,
    this.format,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onlyBottomBorder = false,
  });

  void _openDatePicker(BuildContext context) async {
    var result = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1960, 1, 1),
    );
    if (result != null && this.onDateSelected != null) {
      this.onDateSelected?.call(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this.label != null
            ? Text(
                this.label!,
              )
            : SizedBox(),
        InkWell(
          onTap: onDateSelected != null
              ? () {
                  _openDatePicker(context);
                }
              : null,
          child: Container(
            decoration: this.onlyBottomBorder
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey[300]!,
                      ),
                    ),
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey[300]!,
                    ),
                  ),
            margin: EdgeInsets.only(top: 4),
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value != null
                        ? Jiffy(this.value!).format('dd/MM/yyyy')
                        : "Select Date",
                    style: CustomTextStyles.semibold14,
                  ),
                  this.onDateSelected != null
                      ? Icon(
                          Icons.date_range_outlined,
                          color: AppColors.primaryText,
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
