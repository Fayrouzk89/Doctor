import 'package:flutter/material.dart';

import '../design/ColorConstants.dart';
import '../design/CommonConstants.dart';


class InputFieldEmail extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final String placeholder;
  final Color color;
  final double fontSize;
  final bool password;
  final String? Function(String?)? validator;
  final IconData? icon;
  final bool? enabled;
  InputFieldEmail({
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.labelText = '',
    this.placeholder = '',
    this.color = Colors.grey,
    this.fontSize = 18.0,
    this.password = true,
    this.validator,
    this.icon,
    this.enabled
  });

  @override
  State<InputFieldEmail> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputFieldEmail> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        hintText: this.widget.placeholder,
        hintStyle: TextStyle(
            fontSize:  CommonConstants.hintSizes,
            color: ColorConstants.hintColor,
            // fontWeight: FontWeight.w200,
            fontFamily: CommonConstants.introTextFont
        ),
        isDense: true,
        enabled: (widget.enabled==null ||widget.enabled==true)?true:false,
        fillColor:  ColorConstants.white,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          this.widget.icon,color: ColorConstants.hintColor,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: this.widget.color,width: 1.0,
          ),
        ),
      ),
      controller: this.widget.controller,
      style: TextStyle(
        color: ColorConstants.textColor,
        fontFamily: CommonConstants.introTextFont,
        fontSize: widget.fontSize,
        fontWeight: FontWeight.normal,
      ),
      keyboardType: this.widget.keyboardType,

      autocorrect: false,
      validator: this.widget.validator,

    );
  }
}