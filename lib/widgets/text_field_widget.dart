// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TextFieldWidgets extends StatelessWidget {
  const TextFieldWidgets(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.SuffixIcon,
      this.PrefixIcon,
      this.isShowPrefixIcon = false,
      this.isShowSuffixIcon = false,
      this.ObscureText = false,
      this.number = false,
      this.align = '',
      this.toggleShowPassword,
      this.onChange,
      this.prefixtext = '',
      this.mexlenght})
      : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final IconData? SuffixIcon;
  final IconData? PrefixIcon;
  final bool ObscureText;
  final bool isShowPrefixIcon;
  final bool isShowSuffixIcon;
  final String? align;
  final bool number;
  final VoidCallback? toggleShowPassword;
  final void Function(String)? onChange;
  final String? prefixtext;
  final int? mexlenght;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          obscureText: ObscureText,
          textAlign: align == 'center'
              ? TextAlign.center
              : align == 'right'
                  ? TextAlign.right
                  : TextAlign.left,
          keyboardType: number ? TextInputType.number : TextInputType.text,
          onChanged: onChange,
          maxLength: mexlenght != 0 ? mexlenght : 0,
          decoration: InputDecoration(
            hintText: hintText,
            prefixText: prefixtext != '' ? prefixtext : null,
            prefixIcon:
                isShowPrefixIcon ? Icon(PrefixIcon, color: Colors.grey) : null,
            suffixIcon: isShowSuffixIcon
                ? IconButton(
                    icon: Icon(
                      SuffixIcon,
                      size: 20.0,
                      color: Colors.grey,
                    ),
                    onPressed: toggleShowPassword,
                  )
                : null,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        )
      ],
    );
  }
}
