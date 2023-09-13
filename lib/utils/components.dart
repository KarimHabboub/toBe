import 'package:flutter/material.dart';
import 'package:tobe/utils/styles.dart';

import 'colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.height,
    this.width,
    this.textStyle,
  });

  final double? width;

  final double? height;

  final Color? color;

  final String text;
  final TextStyle? textStyle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * .9,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: color,
      ),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: textStyle ?? Styles.textStyle16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.height,
    this.width,
    this.textStyle,
  });

  final double? width;

  final double? height;

  final Color color;

  final String text;
  final TextStyle? textStyle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * .9,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: color)),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: textStyle ?? Styles.textStyle16.copyWith(color: myTealColor),
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.textControl,
    required this.keyboardType,
    this.label,
    this.prefix,
    required this.validator,
    this.obscureText = false,
    this.suffix,
    this.suffixPressed,
    this.onSubmit,
    this.onTap,
    this.onChange,
    this.hintText,
    this.inputTextStyle,
    this.textAlign = TextAlign.start,
    this.colorIcon,
    this.onEditingComplete,
  });

  final TextEditingController textControl;
  final TextInputType keyboardType;
  final String? label;
  final TextStyle? inputTextStyle;
  final TextAlign textAlign;
  final String? hintText;
  final IconData? prefix;
  final Color? colorIcon;
  final String? Function(dynamic value) validator;
  final bool obscureText;
  final IconData? suffix;
  final VoidCallback? suffixPressed;
  final ValueChanged<String>? onSubmit;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textControl,
      keyboardType: keyboardType,
      style: inputTextStyle,
      textAlign: textAlign,
      cursorColor: myTealColor,
      obscureText: obscureText,
      validator: validator,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onChanged: onChange,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        labelStyle: Styles.textStyle14,
        hintText: hintText,
        hintStyle: Styles.textStyle14,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20.0), // Set the border radius
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: myTealColor),
          borderRadius: BorderRadius.circular(20.0), // Set the border radius
        ),
        prefixIcon: Icon(
          prefix,
          color: colorIcon,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                  color: colorIcon,
                ),
              )
            : null,
      ),
    );
  }
}

