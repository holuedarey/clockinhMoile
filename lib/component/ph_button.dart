import 'package:flutter/material.dart';
import '../../Util/constant.dart';

class PhButton extends StatelessWidget {
  final Color? buttonColor;
  final String buttonName;
  final Color? buttonTextColor;
  final VoidCallback buttonCallBack;
  final double? buttonRadius;
  final double? buttonHeight;
  final bool? isLoading;

  const PhButton({
    Key? key,
    this.buttonColor,
    this.buttonTextColor,
    required this.buttonName,
    required this.buttonCallBack,
    this.buttonRadius,
    this.buttonHeight,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor ?? primaryColor,
        minimumSize: Size.fromHeight(buttonHeight ?? 50), // NEW
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius ?? 10.0),
        ),
      ),
      onPressed: buttonCallBack,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading != null && isLoading == true)
            const CircularProgressIndicator(color: kSecondaryTextColor),
          SizedBox(
            width: kPadding,
          ),
          Text(buttonName,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: buttonTextColor ?? kSecondaryTextColor)),
        ],
      ),
    );
  }
}
