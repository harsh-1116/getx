import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/color_constant.dart';
import '../constant/font_constant.dart';
import 'common_widgets.dart';
import 'custom_textField.dart';

class CustomButton {
  static GestureDetector submitButton(
      {String? text,
        bool? isLoading = false,
        VoidCallback? function,
        double? fontSize,
        FontWeight? fontWeight,
        double width = 200.0,
        double height = 40.0,
        Color? color,
        Color textColor = ColorConstant.whiteColor}) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Center(
          child: CustomTextFields.textField(
            textAlign: TextAlign.center,
            fontFamily: "Roboto",
            textColor: textColor,
            text: text ?? "",
            fontWeight: fontWeight ?? FontWeightConstant.medium,
            fontSize: fontSize ?? FontConstant.font_14, //fontSize
          ),
        ),
      ),
    );
  }

  static GestureDetector fillButton({
    required BuildContext? context,
    Color? backGroundColor,
    Color textColor = ColorConstant.whiteColor,
    String? text,
    FontWeight? fontWeight,
    String? fontFamily = FontFamilyConstant.cabin,
    VoidCallback? function,
    Gradient? gradient,
    double? fontSize,
    double width = 300.0,
    double? height = 42.0,
    bool? isLoading = false,
  }) {
    return GestureDetector(
      onTap: () {
        CommonWidgets().hideKeyboard(context!);
        function?.call();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color: backGroundColor,
          gradient: gradient,
        ),
        child: Center(
          child: CustomTextFields.textField(
            textColor: textColor,
            text: text ?? "",
            fontWeight: fontWeight ?? FontWeightConstant.semi_bold,
            fontFamily: fontFamily,
            fontSize: fontSize ?? FontConstant.font_14, //fontSize
          ),
        ),
      ),
    );
  }

  static GestureDetector fillButtonWithIcon(
      {String? text,
        String? icon,
        VoidCallback? function,
        double? fontSize,
        double width = 200.0,
        double? height,
        double? iconWidth = 16,
        double? iconHeight = 16,
        EdgeInsetsGeometry? iconMargin =const EdgeInsets.only(right: 16),
        FontWeight? fontWeight = FontWeightConstant.medium,
        Color? color,
        Color textColor = ColorConstant.whiteColor}) {
    return GestureDetector(
      onTap: (){
        function?.call();
      },
      child: Container(
        width: width,
        height: height ?? 45.0,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: color),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomTextFields.textField(
              textColor: textColor,
              text: text ?? "",
              fontWeight: fontWeight,
              fontSize: fontSize ?? FontConstant.font_14, //fontSize
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: iconMargin,
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                icon ?? "",
                color: ColorConstant.whiteColor,
                height: iconHeight,
                width: iconWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static GestureDetector borderedButton({
    required BuildContext? context,
    Color? backGroundColor,
    Color textColor = ColorConstant.blackColor,
    String? text,
    FontWeight? fontWeight,
    String? fontFamily,
    VoidCallback? function,
    double? fontSize,
    double width = 100.0,
    double? height = 35.0,
    bool? isLoading = false,
  }) {
    return GestureDetector(
      onTap: () {
        CommonWidgets().hideKeyboard(context!);
        function?.call();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          boxShadow: const [
            BoxShadow(
                color: ColorConstant.greyGradient1,
                blurRadius: 8,
                blurStyle: BlurStyle.normal)
          ],
          color: backGroundColor,
        ),
        child: Center(
          child: CustomTextFields.textField(
            textColor: textColor,
            text: text!,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            fontSize: fontSize ?? FontConstant.font_12, //fontSize
          ),
        ),
      ),
    );
  }

// static GestureDetector fillButtonWithIcon1({
//   BuildContext? context,
//   Color? borderColor,
//   Color? textColor,
//   String? text,
//   String? icon,
//   VoidCallback? function,
//   double? fontSize,
//   double? width,
//   double? height,
// }) {
//   return GestureDetector(
//     onTap: function,
//     child: Container(
//       width: width ?? double.infinity,
//       height: height ?? 45.0,
//       decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//           color: borderColor
//       ),
//       child: Container(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Transform.translate(
//               offset: Offset(0,-2),
//               child: SvgPicture.asset(
//                 icon!,color: Colors.white,
//                 height: 24,width: 24,
//               ),
//             ),
//             SizedBox(width: 2,),
//             CustomTextFields.textField(
//               textColor: textColor,
//               text: text,
//               fontWeight: FontWeight.w500,
//               fontSize: fontSize ?? 14.0, //fontSize
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

}