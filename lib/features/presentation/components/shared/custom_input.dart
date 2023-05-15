part of 'shared.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? label;
  final bool secureText;
  final Function? onTapTrailingIcon;
  final Widget? leadingIcon;
  final void Function(String value)? onSubmit;
  final void Function(String value)? onChanged;
  final TextInputType keyboardType;
  final bool isRequired;
  final bool isInputArea;
  final bool isDisabled;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?)? validator;
  final String? initialValue;

  CustomInput({
    this.controller,
    this.label,
    this.placeholder,
    this.secureText = false,
    this.onTapTrailingIcon,
    this.leadingIcon,
    this.onSubmit,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.isRequired = false,
    this.isDisabled = false,
    this.isInputArea = false,
    this.formatter,
    this.validator,
    this.initialValue,
  });

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool showValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this.widget.label != null
            ? Column(
                children: [
                  Text(this.widget.label!),
                  const SizedBox(height: 8),
                ],
              )
            : const SizedBox(),
        Container(
          color: this.widget.isDisabled ? Colors.grey[200] : Colors.white,
          // height: this.widget.isInputArea ? null : 40,
          child: TextFormField(
            validator: widget.validator,
            enabled: !this.widget.isDisabled,
            onChanged: this.widget.onChanged,
            obscureText: this.widget.secureText ? this.showValue : false,
            // style: Theme.of(context).textTheme.bodyText1,
            keyboardType: this.widget.keyboardType,
            controller: widget.controller,
            onFieldSubmitted: this.widget.onSubmit,
            minLines: this.widget.isInputArea ? 4 : 1,
            maxLines: this.widget.isInputArea ? 4 : 1,
            decoration: InputDecoration(
              hintText: this.widget.placeholder,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 6,
              ),
              border: const OutlineInputBorder(),
              prefixIcon: this.widget.leadingIcon,
              suffixIcon: this.widget.secureText
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          showValue = !this.showValue;
                        });
                      },
                      child: this.showValue
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
