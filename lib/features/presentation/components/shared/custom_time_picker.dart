part of 'shared.dart';

class CustomTimePicker extends StatelessWidget {
  final String? label;
  final String? value;
  final String? placeholder;
  final void Function(String value)? onTimeSelected;
  final bool isRequired;

  CustomTimePicker({
    this.label = "Select time",
    required this.value,
    this.placeholder = "Choose time",
    this.onTimeSelected,
    this.isRequired = false,
  });

  void _openTimePicker(BuildContext context) async {
    var result = await showTimePicker(
      context: context,
      initialTime: value != null
          ? TimeOfDay(
              hour: int.parse(value!.split(":")[0]),
              minute: int.parse(value!.split(":")[1]))
          : const TimeOfDay(hour: 08, minute: 00),
    );

    if (result != null) {
      var response =
          Jiffy.parse("${result.hour}:${result.minute}", pattern: "h:m")
              .format(pattern: "HH:mm");
      if (this.onTimeSelected != null) {
        this.onTimeSelected!(response);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this.label != null ? Text(this.label!) : const SizedBox(),
        TextButton(
          onPressed: onTimeSelected != null
              ? () {
                  _openTimePicker(context);
                }
              : null,
          child: Container(
            margin: const EdgeInsets.only(top: 4),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.grey[300]!,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  this.value != null
                      ? Text(
                          this.value!,
                          style: CustomTextStyles.regular14,
                        )
                      : Text(
                          this.placeholder ?? "Choose time",
                          style: CustomTextStyles.regular12,
                        ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
