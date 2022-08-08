import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/color_constant.dart';
import '../constant/font_constant.dart';

class CustomTextFields {
  //Text
  static Text textField(
      {String text = "",
        Color textColor = ColorConstant.blackColor,
        double fontSize = FontConstant.font_16,
        double? wordSpacing,
        int maxLine = 50,
        double height = 1.0,
        String? fontFamily = FontFamilyConstant.cabin,
        FontWeight? fontWeight,
        FontStyle? fontStyle,
        TextAlign textAlign = TextAlign.center,
        TextOverflow textOverflow = TextOverflow.ellipsis,
        TextDecoration textDecoration = TextDecoration.none}) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        wordSpacing: wordSpacing,
        decoration: textDecoration,
        height: height,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      maxLines: maxLine,
      overflow: textOverflow,
      textAlign: textAlign,
    );
  }

  ///Simple Text

  static TextFormField textFormField(
      {TextEditingController? textEditingController,
        bool? enabled,
        bool readOnly = false,
        bool obscureText = false,
        bool allowValidation = true,
        EdgeInsetsGeometry contentPadding = EdgeInsets.zero,
        bool autofocus = false,
        bool enableInteractiveSelection = true,
        Color enableBorderColor = ColorConstant.whiteColor,
        Color textColor = ColorConstant.whiteColor,
        Color errorBorder = ColorConstant.whiteColor,
        Color focusedErrorBorder = ColorConstant.whiteColor,
        Color fillColor = ColorConstant.whiteColor,
        String? hintText,
        Color hintColor = ColorConstant.whiteColor,
        double? hintFontSize = FontConstant.font_16,
        String? labelText,
        Color? labelColor,
        double? labelFontSize,
        String? errorMessage,
        String? validationMessage,
        String? validationRegex,
        String? initialValue,
        String? valueMessage,
        String? lengthMessage,
        String fontFamily = FontFamilyConstant.cabin,
        FontWeight? fontWeight,
        FontStyle? fontStyle,
        double errorFontSize = FontConstant.font_12,
        int maxLine = 1,
        FocusNode? focusNode,
        String? suffixText,
        Widget? suffixIcon,
        Widget? prefix,
        Widget? prefixIcon,
        TextInputFormatter? inputFormatter,
        FocusNode? nextFocus,
        TextInputAction textInputAction = TextInputAction.done,
        TextInputType? keyBroadType,
        TextCapitalization? textCapitalization,
        TextAlign textAlign = TextAlign.center,
        int? length,
        int? value,
        BoxConstraints prefixIconConstraints =
        const BoxConstraints(maxWidth: 40, maxHeight: 40),
        BoxConstraints suffixIconConstraints =
        const BoxConstraints(maxWidth: 40, maxHeight: 40),
        double cursorWidth = 2.0,
        Function(String)? onFieldSubmit,
        Function(String)? onChanged,
        VoidCallback? onEditingComplete,
        double fontSize = FontConstant.font_16,
        Color errorColor = ColorConstant.selectedLightGreen,
        Color? validationColor,
        Color focusColor = ColorConstant.whiteColor,
        double prefixWidth = 40,
        double prefixHeight = 40}) {
    return TextFormField(
      validator: (text) {
        if (textEditingController!.text.trim().isEmpty && allowValidation) {
          return errorMessage ?? "Invalid Value";
        } else if (value != null &&
            (int.parse(textEditingController.text.trim().trim()) > value)) {
          return valueMessage ?? "Invalid Value";
        } else if (length != null && lengthMessage != null) {
          if (textEditingController.text.trim().length < length ||
              textEditingController.text.trim().length > length) {
            return lengthMessage;
          }
        } else if (validationRegex != null) {
          if (!RegExp(validationRegex).hasMatch(text!.trim())) {
            return validationMessage ?? 'Invalid Value';
          }
        }
        return null;
      },
      cursorWidth: cursorWidth,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmit,
      enabled: enabled,
      autofocus: autofocus,
      controller: textEditingController,
      maxLines: maxLine,
      maxLength: length,
      enableInteractiveSelection: enableInteractiveSelection,
      focusNode: focusNode,
      obscureText: obscureText,
      textInputAction: textInputAction,
      textAlign: textAlign,
      keyboardType: keyBroadType,
      inputFormatters:
      inputFormatter != null ? <TextInputFormatter>[inputFormatter] : null,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
      ),
      decoration: InputDecoration(
          filled: false,
          alignLabelWithHint: true,
          hintText: hintText,
          prefixIconConstraints: prefixIconConstraints,
          suffixIconConstraints: suffixIconConstraints,
          border: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.black)),
          hintStyle: TextStyle(
            color: hintColor,
            fontSize: hintFontSize,
            fontWeight: fontWeight,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: labelColor,
            fontSize: labelFontSize,
            fontWeight: fontWeight,
          ),
          prefix: prefix,
          prefixIcon: prefixIcon,
          suffixText: suffixText,
          suffixIcon: suffixIcon,
          fillColor: fillColor,
          errorStyle: TextStyle(
            color: errorColor,

            ///validation Color
            fontSize: errorFontSize,
            fontWeight: fontWeight,
          ),
          contentPadding: contentPadding,
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: focusColor,
                width: 1.0,
              )),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: errorBorder,
                width: 1.0,
              )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: focusColor, width: 1.0)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: enableBorderColor, width: 1.0))),
    );
  }

  static TextFormField descriptionFormField({
    TextEditingController? textEditingController,
    bool? enabled,
    bool readOnly = false,
    bool obscureText = false,
    bool allowValidation = true,
    bool autofocus = false,
    bool enableInteractiveSelection = true,
    Color? enableBorderColor = ColorConstant.whiteColor,
    Color focusColor = ColorConstant.whiteColor,
    Color? textColor = ColorConstant.greyBackground,
    Color? errorBorder = Colors.black,
    Color? focusedErrorBorder = Colors.black,
    Color? fillColor,
    String? hintText,
    Color? hintColor = ColorConstant.greyBackground,
    double? hintFontSize = FontConstant.font_16,
    String? labelText,
    Color? labelColor,
    double? labelFontSize,
    String? errorMessage,
    String? validationMessage,
    String? validationRegex,
    String? initialValue,
    String? valueMessage,
    String? lengthMessage,
    String fontFamily = FontFamilyConstant.cabin,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double errorFontSize = FontConstant.font_12,
    int maxLine = 1,
    FocusNode? focusNode,
    String? suffixText,
    Widget? suffixIcon,
    Widget? prefix,
    Widget? prefixIcon,
    Color? cursorColor,
    TextInputFormatter? inputFormatter,
    FocusNode? nextFocus,
    TextInputAction textInputAction = TextInputAction.next,
    TextInputType? keyBroadType,
    TextCapitalization? textCapitalization,
    TextAlign textAlign = TextAlign.center,
    int? length,
    int? value,
    EdgeInsetsGeometry contentPadding = EdgeInsets.zero,
    BoxConstraints prefixIconConstraints = const BoxConstraints(maxWidth: 40, maxHeight: 40),
    BoxConstraints suffixIconConstraints = const BoxConstraints(maxWidth: 40, maxHeight: 40),
    Function(String)? onFieldSubmit,
    Function(String)? onChanged,
    VoidCallback? onEditingComplete,
    double fontSize = FontConstant.font_15,
    Color? errorColor=  ColorConstant.selectedLightGreen,
    double? wordSpacing,
  }) {
    return TextFormField(
      validator: (text) {
        if (textEditingController!.text.trim().isEmpty && allowValidation) {
          return errorMessage ?? "Invalid Value";
        } else if (value != null &&
            (int.parse(textEditingController.text.trim()) > value)) {
          return valueMessage ?? "Invalid Value";
        } else if (length != null && lengthMessage != null) {
          if (textEditingController.text.trim().length < length ||
              textEditingController.text.trim().length > length) {
            return lengthMessage;
          }
        } else if (validationRegex != null) {
          if (!RegExp(validationRegex).hasMatch(text!.trim())) {
            return validationMessage ?? 'Invalid Value';
          }
        }
        return null;
      },
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmit,
      enabled: enabled,
      autofocus: autofocus,
      controller: textEditingController,
      maxLines: maxLine,
      cursorColor: cursorColor,
      maxLength: length,
      enableInteractiveSelection: enableInteractiveSelection,
      focusNode: focusNode,
      obscureText: obscureText,
      textInputAction: textInputAction,
      textAlign: textAlign,
      keyboardType: keyBroadType,
      inputFormatters:
      inputFormatter != null ? <TextInputFormatter>[inputFormatter] : null,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        wordSpacing: wordSpacing,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
      ),
      decoration: InputDecoration(
        filled: false,
        alignLabelWithHint: true,
        hintText: hintText,
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedErrorBorder!, width: 1.0)),
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: hintFontSize,
          fontWeight: fontWeight,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelColor,
          fontSize: labelFontSize,
          fontWeight: fontWeight,
        ),
        prefix: prefix,
        prefixIcon: prefixIcon,
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusColor,
              width: 1.0,
            )),
        errorStyle: TextStyle(
          color: errorColor,
          fontSize: errorFontSize,
          fontWeight: fontWeight,
        ),
        contentPadding: contentPadding,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorBorder!, width: 1.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusColor, width: 1.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: enableBorderColor!, width: 1.0)),
      ),
    );
  }

  ///Password Field
  static TextFormField passwordFormField({
    TextEditingController? textEditingController,
    String? hintText,
    Color? cursorColor = ColorConstant.whiteColor,
    bool? enabled,
    Color errorColor = ColorConstant.selectedLightGreen,
    String? labelText,
    Color hintColor = ColorConstant.whiteColor,
    Color fillColor = ColorConstant.whiteColor,
    BoxConstraints prefixIconConstraints =
    const BoxConstraints(maxWidth: 40, maxHeight: 40),
    BoxConstraints suffixIconConstraints =
    const BoxConstraints(maxWidth: 40, maxHeight: 40),
    Color? labelColor,
    EdgeInsetsGeometry contentPadding:
    const EdgeInsets.only(bottom: 0.0, top: 10, right: 30.0),
    Color focusColor = ColorConstant.whiteColor,
    Color enabledBorderColor = ColorConstant.whiteColor,
    Color? errorBorder = ColorConstant.whiteColor,
    Color? focusErrorColor = ColorConstant.whiteColor,
    double? hintFontSize = FontConstant.font_16,
    double? labelFontSize,
    BuildContext? context,
    Function? onFieldSubmit,
    bool obscureText = false,
    String obscuringCharacter = ".",
    FocusNode? focusNode,
    Widget? suffixIcon,
    Widget? prefixIcon,
    int maxLines = 1,
    FocusNode? nextFocusNode,
    TextInputAction textInputAction = TextInputAction.done,
    TextInputType? keyboardType,
    String? validationRegex,
    String? errorMessage,
    String? validationMessage,
    TextCapitalization? textCapitalization,
    int? length,
    bool? allowValidation = false,
    Function(String)? onChanged,
    String? initialValue,
    String? lengthMessage,
    String fontFamily = FontFamilyConstant.cabin,
    double? fontSize,
    FontWeight? fontWeight,
    Color textColor = ColorConstant.whiteColor,
  }) {
    return TextFormField(
      validator: (text) {
        print("Validation Checking");
        if (textEditingController!.text.trim().isEmpty) {
          return errorMessage ?? "Invalid Value";
        } else if (allowValidation ?? false) {
          print("CHECK IN VALIDATION");
          return errorMessage ?? "Invalid Value";
        } else if (length != null) {
          if (textEditingController.text.trim().length < length ||
              textEditingController.text.trim().length > length) {
            return lengthMessage ?? "Invalid Value";
          }
        } else if (validationRegex != null) {
          if (!RegExp(validationRegex).hasMatch(text!.trim())) {
            return validationMessage ?? 'Invalid Value';
          }
        }
        return null;
      },
      onChanged: onChanged,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      controller: textEditingController,
      maxLines: maxLines,
      cursorColor: cursorColor ?? ColorConstant.whiteColor,
      obscuringCharacter: obscuringCharacter,
      enabled: enabled,
      maxLength: length,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[ ]')),],
      decoration: InputDecoration(
        filled: false,
        alignLabelWithHint: true,
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: '',
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
        errorStyle: TextStyle(
            color: errorColor,
            fontSize: FontConstant.font_12,
            fontWeight: FontWeightConstant.regular),
        fillColor: fillColor,
        border:  UnderlineInputBorder(
            borderSide: BorderSide(
              color: enabledBorderColor,
              width: 1.0,
            )),
        contentPadding: contentPadding,
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: errorBorder!,
              width: 1.0,
            )),
        focusColor: focusColor,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: focusColor, width: 1.0)),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: focusErrorColor!,
              width: 1.0,
            )),
        labelStyle: TextStyle(
          color: labelColor,
          fontSize: FontConstant.font_14,
          fontFamily: FontFamilyConstant.cabin,
          fontWeight: FontWeightConstant.regular,
        ),
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: hintFontSize ?? FontConstant.font_16,
          fontFamily: FontFamilyConstant.cabin,
          fontWeight: FontWeightConstant.regular,
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: enabledBorderColor, width: 1.0)),
      ),
      //onFieldSubmitted: onFieldSubmit,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
      focusNode: focusNode,
      obscureText: obscureText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
    );
  }

  static TextFormField searchFormField({
    TextEditingController? textEditingController,
    bool? enabled,
    bool readOnly = false,
    bool obscureText = false,
    bool allowValidation = true,
    bool autofocus = false,
    bool enableInteractiveSelection = true,
    Color? enableBorderColor = ColorConstant.whiteColor,
    Color focusColor = ColorConstant.whiteColor,
    Color? textColor = ColorConstant.greyBackground,
    Paint? backGroundColor,
    Color? errorBorder = Colors.black,
    Color? focusedErrorBorder = Colors.black,
    Color? fillColor,
    String? hintText,
    Color? hintColor = ColorConstant.greyBackground,
    double? hintFontSize,
    String? labelText,
    Color? labelColor,
    double? labelFontSize,
    String? errorMessage,
    String? validationMessage,
    String? validationRegex,
    String? initialValue,
    String? valueMessage,
    String? lengthMessage,
    String fontFamily = FontFamilyConstant.cabin,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double errorFontSize = FontConstant.font_12,
    int maxLine = 1,
    FocusNode? focusNode,
    String? suffixText,
    Widget? suffixIcon,
    Widget? prefix,
    Widget? prefixIcon,
    Color? cursorColor,
    TextInputFormatter? inputFormatter,
    FocusNode? nextFocus,
    TextInputAction textInputAction = TextInputAction.next,
    TextInputType? keyBroadType,
    TextCapitalization? textCapitalization,
    TextAlign textAlign = TextAlign.center,
    int? length,
    int? value,
    EdgeInsetsGeometry? contentPadding,
    BoxConstraints prefixIconConstraints = const BoxConstraints(maxWidth: 30, maxHeight: 30),
    BoxConstraints suffixIconConstraints = const BoxConstraints(maxWidth: 30, maxHeight: 30),
    Function(String)? onFieldSubmit,
    Function(String)? onChanged,
    VoidCallback? onEditingComplete,
    double fontSize = FontConstant.font_15,
    double? wordSpacing,
  }) {
    return TextFormField(
      validator: (text) {
        if (textEditingController!.text.isEmpty && allowValidation) {
          return errorMessage ?? "Invalid Value";
        } else if (value != null &&
            (int.parse(textEditingController.text.trim()) > value)) {
          return valueMessage ?? "Invalid Value";
        } else if (length != null && lengthMessage != null) {
          if (textEditingController.text.length < length ||
              textEditingController.text.length > length) {
            return lengthMessage;
          }
        } else if (validationRegex != null) {
          if (!RegExp(validationRegex).hasMatch(text!.trim())) {
            return validationMessage ?? 'Invalid Value';
          }
        }
        return null;
      },
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmit,
      enabled: enabled,
      autofocus: autofocus,
      controller: textEditingController,
      maxLines: maxLine,
      cursorColor: cursorColor,
      maxLength: length,
      enableInteractiveSelection: enableInteractiveSelection,
      focusNode: focusNode,
      obscureText: obscureText,
      textInputAction: textInputAction,
      textAlign: textAlign,
      keyboardType: keyBroadType,
      inputFormatters:
      inputFormatter != null ? <TextInputFormatter>[inputFormatter] : null,
      style: TextStyle(
        color: textColor,
        background: backGroundColor,
        fontSize: fontSize,
        wordSpacing: wordSpacing,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
      ),
      decoration: InputDecoration(
        filled: true,
        constraints: BoxConstraints(maxWidth: 380, maxHeight: 40),
        alignLabelWithHint: true,
        hintText: hintText,
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: focusedErrorBorder!, width: 1.0)),
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: hintFontSize,
          fontWeight: fontWeight,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelColor,
          fontSize: labelFontSize,
          fontWeight: fontWeight,
        ),
        prefix: prefix,
        prefixIcon: prefixIcon,
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: focusColor,
              width: 1.0,
            )),
        errorStyle: TextStyle(
          color: ColorConstant.selectedLightGreen,
          fontSize: errorFontSize,
          fontWeight: fontWeight,
        ),
        contentPadding: contentPadding,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: errorBorder!, width: 1.0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: focusColor, width: 1.0)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: enableBorderColor!, width: 1.0)),
      ),
    );
  }
}