part of 'shared.dart';

class CustomRightSelect<T> extends StatelessWidget {
  const CustomRightSelect({
    Key? key,
    required this.label,
    required this.selectedValue,
    required this.options,
    this.placeholder,
    this.onTapOption,
    this.labelBuilder,
    this.optionsBuilder,
    this.isLoading = false,
  }) : super(key: key);

  final String label;
  final String? placeholder;

  final T? selectedValue;
  final List<T> options;
  final void Function(T)? onTapOption;
  final String Function(T?)? labelBuilder;
  final String Function(T)? optionsBuilder;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _CustomSelectPage(
              label: label,
              options: options,
              selectedValue: selectedValue,
              onTapOption: onTapOption,
              optionsBuilder: optionsBuilder,
            ),
          ),
        );
      },
      child: AbsorbPointer(
        child: TextField(
          readOnly: true,
          controller: TextEditingController(
            text: _buildLabel(),
          ),
          // style: Style.textFieldTextStyle,
          decoration: InputDecoration(
            labelText: label,
            hintText: placeholder,
            suffix: isLoading
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
                    ),
                  )
                : Icon(
                    Icons.chevron_right,
                    size: 18,
                  ),
          ),
        ),
      ),
    );
  }

  String _buildLabel() {
    if (selectedValue != null) {
      if (labelBuilder != null) return labelBuilder!(selectedValue);
      return selectedValue.toString();
    }
    return "";
  }
}

class _CustomSelectPage<T> extends StatelessWidget {
  const _CustomSelectPage({
    Key? key,
    required this.label,
    this.selectedValue,
    required this.options,
    this.onTapOption,
    this.optionsBuilder,
  }) : super(key: key);

  final String label;
  final T? selectedValue;
  final List<T> options;
  final void Function(T)? onTapOption;
  final String Function(T)? optionsBuilder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          label,
          style: CustomTextStyles.semibold14.copyWith(),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (_, index) {
          return Divider(
            height: 1,
          );
        },
        itemCount: options.length,
        itemBuilder: (context, index) {
          final item = options[index];
          return ListTile(
            dense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            onTap: () {
              onTapOption?.call(item);

              Navigator.of(context).pop();
            },
            title: Text(optionsBuilder?.call(item) ?? item.toString()),
            trailing: item == selectedValue
                ? Icon(
                    Icons.check_rounded,
                    color: Colors.green,
                  )
                : SizedBox(),
          );
        },
      ),
    );
  }
}
