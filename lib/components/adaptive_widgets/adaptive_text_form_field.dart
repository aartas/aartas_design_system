// import 'package:flutter/cupertino.dart';

import 'package:aartas_design_system/const.dart';
import 'package:flutter/material.dart';

enum InputBorderType { underline, outlined, none }

class AdaptiveTextFormField extends StatelessWidget {
  final Widget? prefixWidget, suffixWidget;
  final Function(String)? onChanged;
  final int? maxLength;
  final EdgeInsets? contentPadding;
  final InputBorder? border, focusedBorder, disabledBorder;
  final String? errorText, labelText, initialValue, hintText;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final TextAlign? textAlign;
  final bool? autoFocus,
      enabled,
      filled,
      enableSuggestions,
      obscureText,
      autocorrect;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const AdaptiveTextFormField({
    Key? key,
    this.focusNode,
    this.prefixWidget,
    this.suffixWidget,
    this.onChanged,
    this.maxLength,
    this.contentPadding,
    this.border,
    this.focusedBorder,
    this.disabledBorder,
    this.errorText,
    this.labelText,
    this.initialValue,
    this.textEditingController,
    this.keyboardType,
    this.autoFocus,
    this.enabled,
    this.filled,
    this.textStyle,
    this.hintText,
    this.validator,
    this.enableSuggestions,
    this.obscureText,
    this.autocorrect,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: textTheme(context).titleLarge!.color!,
        width: 0.5,
      ),
    );
    // var _inputBorder = InputBorder.none;
    return Container(
      alignment: Alignment.center,
      height: 80,
      // padding: const EdgeInsets.all(4),
      child: TextFormField(
        textAlign: textAlign != null ? textAlign! : TextAlign.center,
        focusNode: focusNode != null ? focusNode! : null,
        enableSuggestions:
            enableSuggestions != null ? enableSuggestions! : false,
        obscureText: obscureText != null ? obscureText! : false,
        autocorrect: autocorrect != null ? autocorrect! : false,
        validator: validator,
        controller: textEditingController,
        keyboardType: keyboardType != null ? keyboardType! : null,
        cursorColor: textTheme(context).titleMedium!.color!,
        maxLength: maxLength != null ? maxLength! : null,
        autofocus: autoFocus != null ? autoFocus! : false,
        onChanged: onChanged,
        enabled: enabled != null ? enabled! : true,
        initialValue: initialValue != null ? initialValue! : null,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: filled != null ? filled! : null,
          labelText: labelText,
          hintText: hintText,
          counterText: "",
          errorText: errorText,
          border: border != null ? border! : _inputBorder,
          focusedBorder: focusedBorder != null
              ? focusedBorder!
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: textTheme(context).titleMedium!.color!,
                    width: 1,
                  ),
                ),
          enabledBorder: focusedBorder != null ? focusedBorder! : _inputBorder,
          disabledBorder: disabledBorder,
          suffixIcon: suffixWidget,
          contentPadding: contentPadding != null ? contentPadding! : null,
          prefixIcon: prefixWidget,
          labelStyle: textStyle != null
              ? textStyle!
              : textTheme(context).titleMedium?.apply(
                    fontSizeDelta: 4,
                    color: enabled != null && !enabled!
                        ? textTheme(context)
                            .titleMedium!
                            .color!
                            .withOpacity(0.6)
                        : textTheme(context).titleMedium!.color!,
                  ),
          hintStyle: textStyle != null
              ? textStyle!
              : textTheme(context).titleMedium?.apply(
                    fontSizeDelta: 2,
                    color:
                        textTheme(context).titleMedium!.color!.withOpacity(0.6),
                  ),
        ),
        style: textStyle != null
            ? textStyle!
            : textTheme(context).titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
      ),
    );
  }
}
