import 'package:flutter/material.dart';
import '../../Util/constant.dart';

class PhFormField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final double? fieldHeight;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  late  bool obscureText;
  final bool? isPassword;
  final Function()? toggle;
  final String? initialVal;

  PhFormField({
    Key? key,
    this.fieldHeight,
    required this.hintText,
    this.validator,
    this.keyboardType,
    required this.labelText,
    this.onChanged,
    this.controller,
    required this.obscureText,
    this.initialVal,
    this.toggle,
    this.isPassword,

  }) : super(key: key);

  @override
  State<PhFormField> createState() => _PhFormFieldState();
}

class _PhFormFieldState extends State<PhFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            widget.labelText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
          ),
        ),
        SizedBox(
          height: kPaddingSmall,
        ),
        TextFormField(
          obscureText: widget.obscureText!,
          controller: widget.controller,
          onChanged: widget.onChanged,
          initialValue: widget.initialVal,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: kColorGreyII),
            alignLabelWithHint: false,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),

            suffixIcon: widget.isPassword == true ? IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                widget.obscureText! == false ? Icons.visibility : Icons.visibility_off,
                color: kPrimaryColor,
              ),
              onPressed: (){
                setState(() {
                  widget.obscureText = !widget.obscureText;
                });
              },
            ): const SizedBox(height: 0),
          ),
          keyboardType: widget.keyboardType,
          // The validator receives the text that the user has entered.
          validator: widget.validator,

        ),
      ],
    );
  }
}
