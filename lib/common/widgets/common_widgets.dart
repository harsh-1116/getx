import 'package:dream_stock/common/constant/image_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constant/api_constant.dart';
import '../constant/color_constant.dart';
import '../constant/font_constant.dart';
import '../constant/string_constant.dart';
import 'custom_button.dart';
import 'custom_textField.dart';

class CommonWidgets {
  static Widget getPhotos({
    String? imagePath,
    double radius = 8,
    String placeHolderImage = ImageAssets.userProfileMediumPng,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(radius), topLeft: Radius.circular(radius)),
      child: FadeInImage.assetNetwork(
          image: imagePath!,
          fit: BoxFit.cover,
          placeholder: placeHolderImage,
          placeholderFit: BoxFit.fill),
    );
  }

  static Widget commonText(
      {
        Color? color,
        double? fontSize,
        double? height,
        String? text,
        FontWeight? fontWeight,
        int? maxLine =3,
        String fontFamily = FontFamilyConstant.barlow,
        Function? onClick,



      }
      ){
    return  GestureDetector(
      onTap: () {
        onClick?.call();
      },
      child: Text(

         text ?? "",
        maxLines: maxLine,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color,
          fontSize: fontSize,
          height: height,
          fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis,
          fontFamily: fontFamily
        ),
      ),
    );
  }

  static TextStyle commonTextStyle({
  Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    double? fontSize,
    String fontFamily = FontFamilyConstant.barlow,
  }){
    return TextStyle(
        color: color,
        fontSize: fontSize,
        height: 1.0,
        fontWeight: fontWeight,
        overflow: TextOverflow.ellipsis,
        fontFamily: fontFamily
    );
}

  static Widget commonOtpBox({
    String? filledText,
     bool selectedBox = false,
  }){
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        if (kDebugMode) {

          print("tapped on otp box");
        }
      },
      child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: selectedBox == true? ColorConstant.selectedLightGreen : ColorConstant.greyGradient1)
          ),
        child: Center(
          child: GestureDetector(
            onTap: (){
              print("tapped");
            },
            child: CommonWidgets.commonText(
              text: filledText
            ),
          ),
        ),
      ),
    );
  }

  static Widget commonFilledButton({
    required BuildContext? context,
    String? title,
    Color? color,
    Color? textColor,
    double? fontSize=18,
    String? text,
    double? topPadding ,
    FontWeight? fontWeight,
    // VoidCallback? onSubmit,
    void Function()? onclick,
    String fontFamily = FontFamilyConstant.barlow,
  }){
    return Padding(
      padding:  EdgeInsets.only(top: topPadding ?? 0),
      child: GestureDetector(
        onTap: (){
          onclick?.call();
          CommonWidgets().hideKeyboard(context!);
        },
        child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title?? "",
              style:TextStyle(
                color: textColor,
                fontSize: fontSize,
                height: 1.0,
                fontWeight: fontWeight,
                overflow: TextOverflow.ellipsis,
                fontFamily: fontFamily
            ),
            ),
          ),
        ),
      ),
    );
  }

  hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }


  static Widget commonAppBar({
    Color? backgroundColor,
    Color? textColor,
    String? backIcon,
    String? actionIcon,
    String? centerImage,
    String? title,
    Widget? container1,
    required bool isHaveImage,
    required BuildContext context,
    Function? backClick,
    Function? actionClick
  }){
    return Column(
      children: [
        Container(height: 35,
        color: backgroundColor,),
        Container(
          width: double.infinity,
          height:50,
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                    onTap: (){
                      backClick?.call();
                    },
                    child: SvgPicture.asset(backIcon ?? "")),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.23,right:  MediaQuery.of(context).size.width*0.09),
                    child: Container(
                      child:isHaveImage ? SvgPicture.asset(centerImage ?? ImageAssets.blackBackIcon):Text(title ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeightConstant.semi_bold,
                        fontSize: 20,
                        height: 1.2,

                        fontFamily: FontFamilyConstant.barlow
                      )),
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    actionClick?.call();
                  },
                  child: SizedBox(
                    height: 17,
                      width: 60,
                      child: SvgPicture.asset(actionIcon??"")
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget commonSmallAppBar({
    Color? backgroundColor,
    Color? textColor,
    String? backIcon,
    String? actionIcon,
    String? centerImage,
    String? title,
    Widget? container1,
    required bool isHaveImage,
    required BuildContext context,
    Function? backClick,
    Function? actionClick,
    double? containerShadowOpicity,
    required Color containerShadowColor
  }){
    return Column(
      children: [

        Container(
          width: double.infinity,
          height:50,

          decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [ BoxShadow(
                color: containerShadowColor.withOpacity(containerShadowOpicity??0),
                blurRadius: 2.0,
              ),]
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      backClick?.call();
                    },
                    child: SvgPicture.asset(backIcon ?? "")),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.18,),
                    child: Container(
                      child:isHaveImage ? SvgPicture.asset(centerImage ?? ""):Text(title ?? "please set isHaveImage = false",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeightConstant.semi_bold,
                              fontSize: 20,
                              height: 1.2,

                              fontFamily: FontFamilyConstant.barlow
                          )),
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    actionClick?.call();
                  },
                  child: SizedBox(
                      height: 17,
                      width: 60,
                      child: SvgPicture.asset(actionIcon??"")
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget commonIconWithTitle({
  Widget? image,
    String? title,
    Function? onclick,

}){
    return   Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              onclick?.call();
            },
            child: Row(
              children: [
                Container(child: image),
                const SizedBox(
                  width: 15,
                ),
                CommonWidgets.commonText(
                    text: title,
                    fontWeight: FontWeightConstant.semi_bold
                )
              ],
            ),
          ),
        ),
        Divider(height: 2,)
      ],
    );

  }



  static Widget commonCardOfList(
  {
    Function? onClick,
    double? cardHeight,
    Color? cardShadowColor,
    Color? cardColor,
    Color? containerColor,
    double? cardRadius,
    double? contentPadding,
    String? headerText,
    Color? headerColor = ColorConstant.blackColor,
    double? headerFontSize = 16,
    FontWeight? headerFontWeight =FontWeightConstant.semi_bold,
    String headerFontFamily = FontFamilyConstant.barlow,
    String? title1Text,
    Color? title1Color,
    double? title1FontSize,
    FontWeight? title1FontWeight =FontWeightConstant.medium,
    String fontFamily = FontFamilyConstant.barlow,
    String? title2Text,
    Color? title2Color,
    double? title2FontSize,
    FontWeight? title2FontWeight =FontWeightConstant.medium,
    String? title3Text,
    Color? title3Color,
    double? title3FontSize,
    FontWeight? title3FontWeight =FontWeightConstant.medium,
    String? title4Text,
    Color? title4Color,
    double? title4FontSize,
    FontWeight? title4FontWeight =FontWeightConstant.medium,
    String? date,
    double? dateFontSize,
    String? subTitle1Text,
    Color? subTitle1Color,
    double? subTitle1FontSize,
    FontWeight? subTitle1FontWeight =FontWeightConstant.medium,
    String? subTitle2Text,
    Color? subTitle2Color,
    double? subTitle2FontSize,
    FontWeight? subTitle2FontWeight =FontWeightConstant.medium,
    String? subTitle3Text,
    Color? subTitle3Color,
    double? subTitle3FontSize,
    FontWeight? subTitle3FontWeight =FontWeightConstant.medium,
  }
      ){
    return  GestureDetector(
      onTap: (){
        onClick?.call();
      },
      child: Padding(
          padding: const EdgeInsets.only(top: 4.0,left: 12,right: 12),
          child: Card(
            color: cardColor,
            elevation: 0,
            shadowColor: cardShadowColor,
            child: Container(
              height: cardHeight,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: ColorConstant.greyGradient1.withOpacity(0.6),
                  blurRadius: 3,
                  offset: Offset(0,1)
                )],
                  color: containerColor,
                  borderRadius: BorderRadius.circular(cardRadius??0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(contentPadding??0),
                    child: Column(
                        crossAxisAlignment : CrossAxisAlignment.start,
                        children: [
                          CommonWidgets.commonText(
                              text: headerText,
                              color: headerColor,
                              fontSize: headerFontSize,
                              fontWeight: headerFontWeight
                          ),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CommonWidgets.commonText(
                                      text: title1Text,
                                      color: title1Color,
                                      fontSize: title1FontSize,
                                      fontWeight: title1FontWeight,
                                      fontFamily: fontFamily
                                  ),
                                  const SizedBox(width: 7,),
                                  Transform.translate(
                                    offset: const Offset(0,1),
                                    child: CommonWidgets.commonText(
                                      text: title2Text,
                                      color: title2Color,
                                      fontSize: title2FontSize,
                                      fontWeight: title2FontWeight,
                                      fontFamily: fontFamily,


                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CommonWidgets.commonText(
                                    text: title3Text,
                                    color: title3Color,
                                    fontSize: title3FontSize,
                                    fontWeight: title3FontWeight,
                                    fontFamily: fontFamily,

                                  ),
                                  SizedBox(width: 4,),

                                  CommonWidgets.commonText(
                                    text: title4Text,
                                    color: title4Color,
                                    fontSize: title4FontSize,
                                    fontWeight: title4FontWeight,
                                    fontFamily: fontFamily,
                                  ),

                                ],
                              )
                            ],
                          ),

                        ]
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 0.5,
                        color: ColorConstant.greyGradient1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0,right: 15,left: 15,bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(ImageAssets.calenderIcon),const SizedBox(width: 7,),
                                CommonWidgets.commonText(
                                    text: date,
                                    fontSize: dateFontSize
                                )
                              ],
                            ),
                            Transform.translate(
                              offset: const Offset(-9,0),
                              child: CommonWidgets.commonText(
                                  text: subTitle1Text,
                                  color: subTitle1Color,
                                  fontSize: subTitle1FontSize,
                                  fontWeight: subTitle1FontWeight
                              ),
                            ),
                            Row(
                              children: [
                                CommonWidgets.commonText(
                                    text: subTitle2Text,
                                    color: subTitle2Color,
                                    fontSize: subTitle2FontSize,
                                    fontWeight: subTitle2FontWeight
                                ),
                                CommonWidgets.commonText(
                                  text: subTitle3Text,
                                  color: subTitle3Color,
                                  fontSize: subTitle3FontSize,
                                  fontWeight: subTitle3FontWeight
                                )],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  static Widget commonCardOfListWithButton(
      {
        Function? onClick,
        double? cardHeight,
        Color? cardShadowColor,
        Color? cardColor,
        Color? containerColor,
        double? cardRadius,
        double? contentPadding,
        String? headerText,
        Color? headerColor = ColorConstant.blackColor,
        double? headerFontSize = 16,
        FontWeight? headerFontWeight =FontWeightConstant.semi_bold,
        String headerFontFamily = FontFamilyConstant.barlow,
        String? title1Text,
        Color? title1Color,
        double? title1FontSize,
        FontWeight? title1FontWeight =FontWeightConstant.medium,
        String fontFamily = FontFamilyConstant.barlow,
        String? title2Text,
        Color? title2Color,
        double? title2FontSize,
        FontWeight? title2FontWeight =FontWeightConstant.medium,
        String? title3Text,
        Color? title3Color,
        double? title3FontSize,
        double? title3FontHeight,
        FontWeight? title3FontWeight =FontWeightConstant.medium,
        Widget? title4Button,
        Color? title4ButtonColor,
        double? title4ButtonRadius,
        Color? title4ButtonFontColor,
        double? title4ButtonHeight,
        double? title4buttonWidth,
        FontWeight? title4FontWeight =FontWeightConstant.medium,
        String? rank,
        double? rankFontSize,
        Color? rankColor,
        FontWeight? rankFontWeight =FontWeightConstant.semi_bold,

        String? outOfRank,
        double? outOfRankFontSize,
        Color? outOfRankFontColor = ColorConstant.greyGradient1,
        Widget? rankImage,
        Widget? timerImage,
        String? subTitle1Text,
        Color? subTitle1Color,
        double? subTitle1FontSize,
        FontWeight? subTitle1FontWeight =FontWeightConstant.medium,
        String? subTitle2Text,
        Color? subTitle2Color,
        double? subTitle2FontSize,
        FontWeight? subTitle2FontWeight =FontWeightConstant.medium,
        String? subTitle3Text,
        Color? subTitle3Color,
        double? subTitle3FontSize,
        FontWeight? subTitle3FontWeight =FontWeightConstant.medium,
      }
      ){
    return  GestureDetector(
      onTap: (){
        onClick?.call();
      },
      child: Padding(
          padding: const EdgeInsets.only(top: 4.0,left: 12,right: 12),
          child: Card(
            color: cardColor,
            elevation: 0,
            shadowColor: cardShadowColor,
            child: Container(
              height: cardHeight,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                      color: ColorConstant.greyGradient1.withOpacity(0.6),
                      blurRadius: 3,
                      offset: Offset(0,1)
                  )],
                  color: containerColor,
                  borderRadius: BorderRadius.circular(cardRadius??0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(contentPadding??0),
                    child: Column(
                        crossAxisAlignment : CrossAxisAlignment.start,
                        children: [
                          CommonWidgets.commonText(
                              text: headerText,
                              color: headerColor,
                              fontSize: headerFontSize,
                              fontWeight: headerFontWeight
                          ),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CommonWidgets.commonText(
                                      text: title1Text,
                                      color: title1Color,
                                      fontSize: title1FontSize,
                                      fontWeight: title1FontWeight,
                                      fontFamily: fontFamily
                                  ),
                                  const SizedBox(width: 7,),
                                  Transform.translate(
                                    offset: const Offset(0,1),
                                    child: CommonWidgets.commonText(
                                      text: title2Text,
                                      color: title2Color,
                                      fontSize: title2FontSize,
                                      fontWeight: title2FontWeight,
                                      fontFamily: fontFamily,


                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CommonWidgets.commonText(
                                    text: title3Text,
                                    color: title3Color,
                                    fontSize: title3FontSize,
                                    height: title3FontHeight,
                                    fontWeight: title3FontWeight,
                                    fontFamily: fontFamily,

                                  ),
                                  SizedBox(width: 7,),

                                  Container(
                                    height: title4ButtonHeight,
                                    width: title4buttonWidth,
                                    decoration: BoxDecoration(
                                      color: title4ButtonColor,
                                      borderRadius: BorderRadius.circular(title4ButtonRadius??0)
                                    ),
                                    child: Center(
                                      child: Text("${StringConstant.rupee} 176",style: TextStyle(
                                        color: title4ButtonFontColor
                                      ),),
                                    ),
                                  )

                                ],
                              )
                            ],
                          ),

                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15,left: 15,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CommonWidgets.commonText(
                              text: rank,
                                fontSize: rankFontSize,
                              color: rankColor,
                              fontWeight: rankFontWeight
                            ),
                            CommonWidgets.commonText(
                                text: "/ ${outOfRank}",
                                fontSize: outOfRankFontSize,
                              color: outOfRankFontColor
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(child: rankImage),
                            SizedBox(width: 4,),
                            CommonWidgets.commonText(
                                text: subTitle1Text,
                                color: subTitle1Color,
                                fontSize: subTitle1FontSize,
                                fontWeight: subTitle1FontWeight
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(child: timerImage),
                            SizedBox(width: 5,),
                            CommonWidgets.commonText(
                                text: subTitle3Text,
                                color: subTitle3Color,
                                fontSize: subTitle3FontSize,
                                fontWeight: subTitle3FontWeight
                            )],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  static  commonToolBar(
      {String leftImage = "",
        Function? leftImageClick,
        String rightImage = "",
        Widget? rightWidget,
        Function? rightImageClick,
        required bool isShowAppIcon,
        String? title = "",
        required BuildContext context})
  {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Visibility(
                visible: leftImage.isNotEmpty,
                child: GestureDetector(
                  onTap: () {
                    leftImageClick?.call();
                  },
                  child: SvgPicture.asset(
                    leftImage,
                    width: 26,
                    height: 26,
                  ),
                ),
              ),
              Expanded(
                  child: isShowAppIcon
                      ? Image.asset(ImageAssets.dreamStockTextLogo,
                      width: 155, height: 32)
                      : Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  )),
              rightImage.isNotEmpty
                  ? GestureDetector(
                onTap: () {
                  rightImageClick?.call();
                },
                child: SvgPicture.asset(
                  rightImage,
                  width: 26,
                  height: 26,
                ),
              )
                  : rightWidget ?? const SizedBox(width: 26, height: 26)
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: ColorConstant.selectedLightGreen,
        )
      ],
    );
  }


  static Widget commonTextFormField(

      {
        String? hint,
        bool autofocus = false,
        double fontSize = 17,
        bool readOnly = false,
        Function? onChanged,
        Function? onTap,
        TextEditingController? textEditingController,
        Color textColor = Colors.black,
        Widget? suffixIcon,
        Widget? prefixIcon,
        bool obscureText = false,
        EdgeInsets? contentPadding = const EdgeInsets.all(15),
        Function? onEditingComplete,
        String? labelText,
        FontWeight? fontWeight,
        String fontFamily = FontFamilyConstant.barlow,
        String? counterText,
        ///validation
        bool allowValidation = true,
        String? errorMessage,
        String? validationMessage,
        String? validationRegex,
        int? value,
        int? length,
        String? lengthMessage,
        ///
        // required bool isTopPadding,
        // TextAlign textAlign = TextAlign.start,
        // TextInputType textInputType = TextInputType.text,
        // bool expands = false,
        // int maxLines = 1,
        // int minLines = 1,
        // String? initialValue,
        // bool enabled = true,
        // String? suffixText,
        // TextInputAction textInputAction = TextInputAction.next,
        // TextCapitalization textCapitalization = TextCapitalization.sentences,
        // int maxLength = TextField.noMaxLength,
        // Color fillColor = Colors.white,
        // String? imageName,
        // String? prefixText,
        // String? helperText,


      }) {
    return/* Padding(
      padding: EdgeInsets.only(top: isTopPadding ? 8.0 : 0.0),
      child:*/ TextFormField(
      validator: (text){
        if(textEditingController!.text.trim().isEmpty && allowValidation){
          return errorMessage ?? "Invalid errorMessage";
        }
        else if(value != null && (int.parse(textEditingController.text.trim().trim())>value)){
          return validationMessage??"Invalid value";
        }
        else if(length != null && lengthMessage != null) {
          if (textEditingController.text
              .trim()
              .length < length ||
              textEditingController.text
                  .trim()
                  .length > length) {
            return lengthMessage;
          }
        }
        else if(validationRegex != null){
            if(!RegExp(validationRegex).hasMatch(text!.trim())){
              return validationMessage ?? "Inavalid Validation Message";
            }
          }
        return null;
      },

      decoration: InputDecoration(
        contentPadding: contentPadding,
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 17,
          color:  ColorConstant.greyFont
        ),
        counterStyle: const TextStyle(color: ColorConstant.selectedLightGreen),
        counterText: counterText,
        suffixIcon: SizedBox(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: suffixIcon,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(

            minHeight: 33,
          minWidth: 33,
            maxHeight: 90,
            maxWidth: 90,


        ),
        prefixIcon: prefixIcon,
        // suffixText: suffixText,
        suffixStyle: TextStyle(fontSize: fontSize, color: textColor),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide:
            const BorderSide(color: ColorConstant.greyGradient1)),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorConstant.greyFont)
        ),
        hintStyle: TextStyle(
          inherit: true,
          fontSize: fontSize,
          color: ColorConstant.greyFont,
        ),
        hintText: hint,
      ),
      cursorHeight: 16,
      obscuringCharacter: "*",
      readOnly: readOnly,
      controller: textEditingController,
      onChanged: (value) {
        onChanged?.call(value);
        },
      onTap: () {
          onTap?.call();
        },
      onEditingComplete: () {
        onEditingComplete?.call();
        },
      cursorColor: ColorConstant.greyFont,
      obscureText: obscureText,
      autofocus: autofocus,
      style: TextStyle(fontSize: fontSize, color: textColor,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
        height: 1.0
      ),


      // textCapitalization: textCapitalization,
      // enabled: enabled,
      // maxLines: maxLines,
      // minLines: minLines,
      // expands: expands,
      // textAlign: textAlign,
      // keyboardType: textInputType,
      // maxLength: maxLength,


      /*)*/
    );
  }


  paginationIndicator() {
    return Container(
        width: 16,
        height: 16,
        margin: EdgeInsets.only(top: 4, bottom: 4),
        child: const CircularProgressIndicator(
          color: ColorConstant.selectedLightGreen,
          strokeWidth: 2,
        ));
  }

  handleErrorDialog(String msg, BuildContext context) {
    return Get.defaultDialog(
      title: "",
      contentPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      middleText: msg,
      // textConfirm: StringAssets.okay,
      onConfirm: () {
        if (Get.overlayContext != null) {
          Navigator.of(Get.overlayContext!).pop();
        }
      },
      confirm: CustomButton.fillButton(
          width: 60,
          height: 36,
          context: context,
          function: () {
            Navigator.of(Get.overlayContext!).pop();
          },
          text: StringConstant.okay,
          fontSize: FontConstant.font_18,
          backGroundColor: ColorConstant.selectedLightGreen),
      radius: 10,
      middleTextStyle: const TextStyle(
          color: ColorConstant.blackColor,
          fontSize: FontConstant.font_14,
          fontWeight: FontWeightConstant.regular),
      // confirmTextColor: ColorConstant.submit_button
    );
  }

  Widget noDataFound(
      BuildContext context, {
        bool isShowIcon = true,
        bool isButtonShow = true,
        bool isMsgShow = true,
        String icon = ImageAssets.userProfileMediumPng,
        String msg = StringConstant.no,
        String buttonTxt = StringConstant.noDataFound,
        double? fontSize,
        Function? onClick,
        Color? cardColor,
      }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: isShowIcon,
          child: SvgPicture.asset(
            icon,
            height: 40,
            width: 40,
          ),
        ),
        Visibility(
          visible: isMsgShow,
          child: Container(
            margin: EdgeInsets.only(top: 8),
            child: CustomTextFields.textField(
              wordSpacing: 0.0,
              height: 0,
              text: msg,
              textAlign: TextAlign.center,
              fontWeight: FontWeightConstant.semi_bold,
              fontSize: fontSize ?? FontConstant.font_16,
            ),
          ),
        ),
        Visibility(
          visible: isButtonShow,
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: CustomButton.fillButton(
              context: context,
              width: 160,
              height: 34,
              text: buttonTxt,
              fontSize: FontConstant.font_14,
              fontWeight: FontWeightConstant.bold,
              function: () {
                onClick?.call();
              },
              backGroundColor: ColorConstant.selectedLightGreen,
            ),
          ),
        )
      ],
    );
  }

  static Widget categoryView({
    required BuildContext context,
    String? categoryName,
    String? imagePath,
    String? color,
    VoidCallback? onTap,
    Color? playlistCounterColor,
    String? playlistCounterText,
  }) {
    String? updatedColor = color?.replaceAll('#', '').trim();
    if (updatedColor == null) {
      updatedColor = "000000";
    }
    var widgetColor = Color(int.parse("0xff" + "${updatedColor}"));
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0))),
                  width: 190,
                  height: 220,
                  child: CommonWidgets.getPhotos(
                    imagePath: imagePath ?? "",
                    placeHolderImage: ImageAssets.userProfileMediumPng,
                  ),
                ),
              ),
              Container(
                width: 190,
                padding: EdgeInsets.only(top: 16.0, bottom: 16),
                decoration: BoxDecoration(
                    color: widgetColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0))),
                child: CustomTextFields.textField(
                    textAlign: TextAlign.center,
                    text: categoryName ?? "",
                    textColor: ColorConstant.whiteColor,
                    fontWeight: FontWeightConstant.bold,
                    fontSize: FontConstant.font_16),
              )
            ],
          ),
          Positioned(
            right: 1.0,
            child: Visibility(
              visible: playlistCounterColor != null,
              child: Container(
                height: 20,
                width: 35,
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: ColorConstant.blackColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0)),
                child: CustomTextFields.textField(
                    textAlign: TextAlign.center,
                    text: playlistCounterText ?? "",
                    textColor: ColorConstant.whiteColor,
                    fontWeight: FontWeightConstant.bold,
                    fontSize: FontConstant.font_12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget subCategoryView({
    required BuildContext context,
    String? containerBackground,
    Color? backGroundColor,
    String? deleteIcon,
    String? likeIcon,
    String? likeActiveIcon,
    String? addPlaylistIcon,
    String? categoryContentName,
    String? contentIcon,
    String? timeDuration,
    final bool? isTimeDuration,
    final void Function()? contentOnTap,
    final void Function()? likeOnTap,
    final void Function()? deleteOnTap,
    final void Function()? addPlayListOnTap,
  }) {
    RxInt selectedIndex = 0.obs;
    return GestureDetector(
      onTap: contentOnTap,
      child: Container(
          height: 135,
          padding: EdgeInsets.all(13.0),
          margin: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: backGroundColor,
            image:
            DecorationImage(image: AssetImage(containerBackground ?? "")),
            borderRadius: BorderRadius.circular(10.0),
          ),

          ///BACKGROUND COLOR
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: deleteIcon != null && deleteIcon.isNotEmpty,
                    child: GestureDetector(
                        onTap: deleteOnTap,
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            deleteIcon ?? "",
                            height: 24,
                          ),
                        )),
                  ),
                  Obx(
                        () => Container(
                      margin: EdgeInsets.only(
                          right: addPlaylistIcon != null &&
                              addPlaylistIcon.isNotEmpty
                              ? 10
                              : 0),
                      child: GestureDetector(
                        onTap: likeOnTap,
                        child: selectedIndex == 1
                            ? SvgPicture.asset(
                          likeActiveIcon ?? "",
                          height: 24,
                        )
                            : SvgPicture.asset(
                          likeIcon ?? "",
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible:
                    addPlaylistIcon != null && addPlaylistIcon.isNotEmpty,
                    child: GestureDetector(
                      onTap: () {
                        addPlayListOnTap?.call();
                      },
                      child: SvgPicture.asset(
                        addPlaylistIcon ?? "",
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: [
                      Visibility(
                        visible: contentIcon != null && contentIcon.isNotEmpty,
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 8,
                          ),
                          child: SvgPicture.asset(
                            contentIcon ?? "",
                          ),
                        ),
                      ),
                      CustomTextFields.textField(
                        text: categoryContentName ?? "",
                        fontWeight: FontWeightConstant.bold,
                        fontSize: FontConstant.font_20,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: timeDuration != null,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextFields.textField(
                    text: timeDuration ?? "",
                    fontWeight: FontWeightConstant.medium,
                    fontSize: FontConstant.font_16,
                  ),
                ),
              ),

              ///Audio Duration
            ],
          )),
    );
  }

  Widget circleImageView(
      {double? width = 58.0,
        double? height = 58.0,
        String? image,
        String? placeHolderImage = ImageAssets.userProfileMediumPng,
        double radius = 30.0}) {
    print("Image Path $image");
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: (image != null && image.isNotEmpty)
            ? FadeInImage.assetNetwork(
          fit: BoxFit.fill,
          image: image,
          placeholder: placeHolderImage ?? "",
        )
            : Image.asset(placeHolderImage ?? ""),
      ),
    );
  }

  // recordingBottomSheet({
  //   required BuildContext context,
  //   Gradient? gradient,
  //   String? title,
  //   String? micIcon,
  //   String? statusText,
  //   Color? playColor,
  //   Color? saveColor,
  //   Color? addAudioColor,
  //   void Function()? playIconOnTap,
  //   void Function()? saveOnTap,
  //   void Function()? addAudio,
  //   TextEditingController? addAudioName,
  // }) {
  //   var initValue = 0.obs;
  //   return Get.bottomSheet(
  //     SingleChildScrollView(
  //       child: Container(
  //         margin: EdgeInsets.only(
  //             bottom: MediaQuery.of(context).size.height * 0.05),
  //         padding: EdgeInsets.all(8.0),
  //         child: Container(
  //           decoration: const BoxDecoration(
  //               color: ColorConstant.whiteColor,
  //               borderRadius: BorderRadius.all(Radius.circular(40))),
  //           child: Stack(
  //             alignment: Alignment.topCenter,
  //             children: [
  //               Container(
  //                 width: double.infinity,
  //                 height: MediaQuery.of(context).size.height * 0.14,
  //                 decoration: BoxDecoration(
  //                     borderRadius: const BorderRadius.only(
  //                         topLeft: Radius.circular(35),
  //                         topRight: Radius.circular(35)),
  //                     gradient: gradient),
  //                 child: Center(
  //                   child: CustomTextFields.textField(
  //                       text: title ?? "",
  //                       textColor: ColorConstant.whiteColor,
  //                       textAlign: TextAlign.center,
  //                       fontSize: FontConstant.font_22,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //
  //               Obx(
  //                     () => Visibility(
  //                   visible: initValue.value == 0,
  //                   child: GestureDetector(
  //                     onTap: () {
  //                       initValue.value = 1;
  //                     },
  //                     child: Container(
  //                       width: 80,
  //                       height: 80,
  //                       margin: EdgeInsets.only(
  //                           top: MediaQuery.of(context).size.height * 0.22),
  //                       decoration: const BoxDecoration(
  //                         borderRadius:
  //                         BorderRadius.all(Radius.circular(50.0)),
  //                         boxShadow: [
  //                           BoxShadow(
  //                               color: ColorConstant.greyBackground,
  //                               blurRadius: 20,
  //                               blurStyle: BlurStyle.normal)
  //                         ],
  //                         color: ColorConstant.whiteColor,
  //                       ),
  //                       child: Container(
  //                           padding: EdgeInsets.all(20),
  //                           child: SvgPicture.asset(
  //                             ImageAssets.userProfileMediumPng,
  //                             width: 30,
  //                             height: 30,
  //                           )),
  //                       // width: MediaQuery.of(context).size.width * 0.70,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Obx(
  //                     () => Visibility(
  //                   visible: initValue == 0,
  //                   child: Center(
  //                     child: Container(
  //                       padding: EdgeInsets.only(
  //                           top: MediaQuery.of(context).size.height * 0.37,
  //                           bottom: MediaQuery.of(context).size.height * 0.04),
  //                       child: CustomTextFields.textField(
  //                         text: StringConstant.start,
  //                         // statusText ?? "",
  //                         fontSize: FontConstant.font_22,
  //                         textColor: ColorConstant.greyBackground,
  //                         textAlign: TextAlign.center,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //
  //               ///start recording
  //               Obx(
  //                     () => Visibility(
  //                   visible: initValue.value == 1,
  //                   child: Container(
  //                     margin: EdgeInsets.only(
  //                         top: MediaQuery.of(context).size.height * 0.18),
  //                     child: GestureDetector(
  //                       onTap: () {
  //                         initValue.value = 2;
  //                       },
  //                       child: SvgPicture.asset(micIcon!),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Obx(
  //                     () => Visibility(
  //                   visible: initValue == 1,
  //                   child: Center(
  //                     child: Container(
  //                       padding: EdgeInsets.only(
  //                           top: MediaQuery.of(context).size.height * 0.38,
  //                           bottom: MediaQuery.of(context).size.height * 0.04),
  //                       child: CustomTextFields.textField(
  //                         text: StringConstant.stop,
  //                         // statusText ?? "",
  //                         fontSize: FontConstant.font_22,
  //                         textColor: ColorConstant.greyBackground,
  //                         textAlign: TextAlign.center,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //
  //               ///recording pused
  //
  //               Obx(
  //                     () => Visibility(
  //                   visible: initValue == 2,
  //                   child: Padding(
  //                     padding: EdgeInsets.only(
  //                         top: MediaQuery.of(context).size.height * 0.18,
  //                         bottom: MediaQuery.of(context).size.height * 0.04),
  //                     child: Column(
  //                       children: [
  //                         SvgPicture.asset(ImageAssets.userProfileMediumPng),
  //                         Padding(
  //                           padding: EdgeInsets.only(
  //                               top: MediaQuery.of(context).size.height * 0.05),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                             children: [
  //                               Container(
  //                                 child: CustomButton.fillButtonWithIcon(
  //                                     function: playIconOnTap,
  //                                     width: MediaQuery.of(context).size.width *
  //                                         0.40,
  //                                     text: StringConstant.noDataFound,
  //                                     icon: ImageAssets.userProfileMediumPng,
  //                                     textColor: ColorConstant.whiteColor,
  //                                     fontSize: 18,
  //                                     color: playColor),
  //                               ),
  //                               Container(
  //                                 child: CustomButton.fillButton(
  //                                     function: () {
  //                                       initValue.value = 3;
  //                                     },
  //                                     width: MediaQuery.of(context).size.width *
  //                                         0.40,
  //                                     text: StringConstant.save,
  //                                     textColor: ColorConstant.whiteColor,
  //                                     fontSize: 18,
  //                                     backGroundColor: saveColor,
  //                                     context: context),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //
  //               Obx(() => Visibility(
  //                 visible: /*addAudioName != null &&*/ initValue == 3,
  //                 child: Padding(
  //                   padding: EdgeInsets.only(
  //                     left: MediaQuery.of(context).size.width * 0.20,
  //                     right: MediaQuery.of(context).size.width * 0.18,
  //                     bottom: MediaQuery.of(context).size.height * 0.00,
  //                     top: MediaQuery.of(context).size.height * 0.22,
  //                   ),
  //                   child: CustomTextFields.textFormField(
  //                     hintText: StringConstant.noDataFound,
  //                     hintColor: ColorConstant.greyBackground,
  //                     hintFontSize: 16,
  //                     // textEditingController: addAudioName,
  //                     textColor: ColorConstant.greyBackground,
  //                     textAlign: TextAlign.center,
  //                     enableBorderColor: ColorConstant.greyBackground,
  //                     focusColor: ColorConstant.greyBackground,
  //                     textInputAction: TextInputAction.done,
  //                   ),
  //                 ),
  //               )),
  //
  //               ///Name
  //
  //               Obx(() => Visibility(
  //                 visible: initValue == 3,
  //                 child: Padding(
  //                   padding: EdgeInsets.only(
  //                     top: MediaQuery.of(context).size.height * 0.34,
  //                     bottom: MediaQuery.of(context).size.height * 0.05,
  //                   ),
  //                   child: CustomButton.submitButton(
  //                       width: 300,
  //                       text: StringConstant.noDataFound,
  //                       function: () {},
  //                       textColor: ColorConstant.whiteColor,
  //                       color: addAudioColor),
  //                 ),
  //               )),
  //
  //               ///add Button
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(50),
  //     ),
  //   ).then((value) => {});
  // }

  // static void addPhrasesBottomSheet({
  //   required BuildContext context,
  //   String? titleCategory,
  //   TextEditingController? enterPhrasesController,
  //   void Function()? playOnTap,
  //   void Function()? saveOnTap,
  // }) {
  //   final GlobalKey<FormState> form = GlobalKey<FormState>();
  //
  //   return showBottomSheetDialog(
  //       context: context,
  //       view: CommonBottomSheet(
  //         title: StringConstant.add_new_phrases,
  //         gradient: CommonLinearGradient.homeGradient,
  //         view: Form(
  //           key: form,
  //           child: Container(
  //             padding:
  //             EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
  //             child: Column(
  //               children: [
  //                 Container(
  //                   height: 100,
  //                   width: double.infinity,
  //                   child: CustomTextFields.descriptionFormField(
  //                       errorColor: ColorConstant.app_top,
  //                       contentPadding: EdgeInsets.only(
  //                           left: 8, right: 8, top: 4, bottom: 4),
  //                       hintText: StringConstant.enter_phrase,
  //                       cursorColor: ColorConstant.dark_grey,
  //                       hintFontSize: FontConstant.font_14,
  //                       textEditingController: enterPhrasesController,
  //                       maxLine: 10,
  //                       wordSpacing: 1.5,
  //                       textInputAction: TextInputAction.done,
  //                       validationMessage:
  //                       StringConstant.please_valid_enter_phrases,
  //                       errorMessage: StringConstant.please_enter_phrases,
  //                       keyBroadType: TextInputType.multiline,
  //                       hintColor: ColorConstant.dark_grey,
  //                       textAlign: TextAlign.left,
  //                       textColor: ColorConstant.dark_grey,
  //                       enableBorderColor: ColorConstant.border,
  //                       errorBorder: ColorConstant.border,
  //                       focusColor: ColorConstant.border),
  //                 ),
  //                 Container(
  //                   margin: EdgeInsets.only(top: 20),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                     children: [
  //                       Expanded(
  //                         child: Container(
  //                           margin: EdgeInsets.only(right: 8),
  //                           child: CustomButton.fillButtonWithIcon(
  //                             function: () {
  //                               if (form.currentState!.validate()) {
  //                                 getAudioFile(enterPhrasesController!.text);
  //                                 playOnTap?.call();
  //                               }
  //                             },
  //                             text: StringConstant.play,
  //                             icon: ImageAssets.play_icon,
  //                             textColor: ColorConstant.white,
  //                             fontWeight: FontWeightConstant.semi_bold,
  //                             fontSize: FontConstant.font_18,
  //                             color: ColorConstant.speech,
  //                           ),
  //                         ),
  //                       ),
  //                       Expanded(
  //                         child: CustomButton.fillButton(
  //                             context: context,
  //                             function: () {
  //                               if (form.currentState!.validate()) {
  //                                 saveOnTap?.call();
  //                               }
  //                             },
  //                             /* if (phraseState.decriptionFormKey.currentState!
  //                                     .validate()) {
  //                                   getContentLogic
  //                                       .addCategoryContentApi(widget.id);
  //                                 }*/
  //                             text: StringConstant.save,
  //                             fontWeight: FontWeightConstant.semi_bold,
  //                             textColor: ColorConstant.white,
  //                             fontSize: FontConstant.font_18,
  //                             backGroundColor: ColorConstant.speech),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         subTitle: titleCategory,
  //       ));
  //
  //   /*  return Get.bottomSheet(
  //     SingleChildScrollView(
  //       child: Container(
  //         padding: EdgeInsets.all(8.0),
  //         margin: EdgeInsets.only(bottom: 20.0),
  //         child: Container(
  //           decoration: BoxDecoration(
  //               color: ColorConstant.white,
  //               borderRadius: BorderRadius.all(Radius.circular(35))),
  //           child: Column(
  //             children: [
  //               Container(
  //                 width: double.infinity,
  //                 height: MediaQuery.of(context).size.height * 0.16,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.only(
  //                         topLeft: Radius.circular(35),
  //                         topRight: Radius.circular(35)),
  //                     gradient: CommonLinearGradient.homeGradient),
  //                 child: Center(
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       CustomTextFields.textField(
  //                           text: StringAssets.add_new_phrases,
  //                           textColor: ColorConstant.white,
  //                           textAlign: TextAlign.center,
  //                           fontSize: FontConstant.font_20,
  //                           fontWeight: FontWeight.bold),
  //                       Visibility(
  //                         visible:
  //                             titleCategory != null && titleCategory.isNotEmpty,
  //                         child: Padding(
  //                           padding: EdgeInsets.only(
  //                               top: MediaQuery.of(context).size.height * 0.01),
  //                           child: CustomTextFields.textField(
  //                               text: titleCategory ?? "",
  //                               textColor: ColorConstant.white,
  //                               textAlign: TextAlign.center,
  //                               fontSize: FontConstant.font_18,
  //                               fontWeight: FontWeightConstant.regular),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 margin: EdgeInsets.only(
  //                     top: MediaQuery.of(context).size.height * 0.03),
  //                 height: 100,
  //                 width: double.infinity,
  //                 child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: CustomTextFields.descriptionFormField(
  //                         contentPadding: EdgeInsets.only(
  //                             left: MediaQuery.of(context).size.width * 0.02,
  //                             top: MediaQuery.of(context).size.width * 0.02),
  //                         hintText: StringAssets.enter_phrase,
  //                         cursorColor: ColorConstant.dark_grey,
  //                         hintFontSize: FontConstant.font_14,
  //                         textEditingController: enterPhrasesController,
  //                         maxLine: 6,
  //                         wordSpacing: 1.5,
  //                         textInputAction: TextInputAction.done,
  //                         validationMessage:
  //                             StringAssets.please_valid_enter_phrases,
  //                         errorMessage: StringAssets.please_enter_phrases,
  //                         keyBroadType: TextInputType.multiline,
  //                         hintColor: ColorConstant.dark_grey,
  //                         textAlign: TextAlign.left,
  //                         textColor: ColorConstant.dark_grey,
  //                         enableBorderColor: ColorConstant.border,
  //                         focusColor: ColorConstant.border)),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(
  //                     top: MediaQuery.of(context).size.height * 0.03,
  //                     bottom: MediaQuery.of(context).size.height * 0.04),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children: [
  //                     Container(
  //                       child: Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: CustomButton.fillButtonWithIcon(
  //                             function: playOnTap,
  //                             width: MediaQuery.of(context).size.width * 0.40,
  //                             text: StringAssets.play,
  //                             icon: ImageConstant.play_icon,
  //                             textColor: ColorConstant.white,
  //                             fontSize: 18,
  //                             color: ColorConstant.speech),
  //                       ),
  //                     ),
  //                     Container(
  //                       child: CustomButton.fillButton(
  //                           context: context,
  //                           function: saveOnTap,
  //                           */ /* if (phraseState.decriptionFormKey.currentState!
  //                                 .validate()) {
  //                               getContentLogic
  //                                   .addCategoryContentApi(widget.id);
  //                             }*/ /*
  //                           width: MediaQuery.of(context).size.width * 0.40,
  //                           text: StringAssets.save,
  //                           fontWeight: FontWeightConstant.medium,
  //                           textColor: ColorConstant.white,
  //                           fontSize: 18,
  //                           backGroundColor: ColorConstant.speech),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(50),
  //     ),
  //   );*/
  // }

  // void createNewPlaylist(
  //     {required BuildContext context,
  //       TextEditingController? controller,
  //       Function? onClick}) {
  //   final GlobalKey<FormState> form = GlobalKey<FormState>();
  //   showBottomSheetDialog(
  //       context: context,
  //       view: CommonBottomSheet(
  //         title: StringConstant.home,
  //         view: Form(
  //           key: form,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Padding(
  //                 padding:
  //                 EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 40),
  //                 child: CustomTextFields.textFormField(
  //                   hintText: StringConstant.enter_name,
  //                   hintColor: ColorConstant.enableLine_color,
  //                   hintFontSize: FontConstant.font_16,
  //                   errorColor: ColorConstant.app_top,
  //                   errorMessage: StringConstant.please_enter_name,
  //                   textAlign: TextAlign.center,
  //                   textEditingController: controller,
  //                   textColor: ColorConstant.blackColor,
  //                   enableBorderColor: ColorConstant.greyBackground,
  //                   errorBorder: ColorConstant.dark_grey,
  //                   focusColor: ColorConstant.dark_grey,
  //                 ),
  //               ),
  //               Container(
  //                 padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
  //                 child: CustomButton.fillButton(
  //                     context: context,
  //                     function: () {
  //                       if (form.currentState!.validate()) {
  //                         onClick?.call();
  //                       }
  //                     },
  //                     text: StringConstant.save,
  //                     fontSize: 18,
  //                     backGroundColor: ColorConstant.submit_button),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ));
  // }

  confirmationDialog(BuildContext context,
      {String title = "",
        String rightButton = StringConstant.yes,
        String leftButton = StringConstant.no,
        Color rightButtonColor = ColorConstant.greyBackground,
        Color leftButtonColor = ColorConstant.selectedLightGreen,
        Function? rightButtonClick,
        Function? leftButtonClick,
        String msg = ""}) {
    return Get.defaultDialog(
        title: title,
        contentPadding: EdgeInsets.zero,
        content: Padding(
          padding:
          const EdgeInsets.only(left: 16.0, right: 16, top: 8, bottom: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFields.textField(
                  text: msg,
                  textAlign: TextAlign.center,
                  textColor: ColorConstant.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: FontConstant.font_18),
              Container(
                margin: EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 32),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          leftButtonClick?.call();
                        },
                        child: CustomTextFields.textField(
                            text: leftButton,
                            textColor: leftButtonColor,
                            fontSize: FontConstant.font_18,
                            fontWeight: FontWeightConstant.bold),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 6),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          rightButtonClick?.call();
                        },
                        child: CustomTextFields.textField(
                            text: rightButton,
                            textColor: rightButtonColor,
                            fontSize: FontConstant.font_18,
                            fontWeight: FontWeightConstant.bold),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        radius: 10.0);
  }

  Widget bottomSheetListView(String image, String title,
      {String? secondaryImage, Function? onClick}) {
    return GestureDetector(
      onTap: () {
        onClick?.call();
      },
      child: Container(
        margin: EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  padding: EdgeInsets.all(2),
                  child: CommonWidgets().circleImageView(
                      width: 34, height: 34, radius: 30, image: image),
                ),
                Visibility(
                  visible: secondaryImage != null && secondaryImage.isNotEmpty,
                  child: Positioned(
                      right: 4,
                      bottom: 0,
                      child: SvgPicture.asset(secondaryImage ?? "")),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: CustomTextFields.textField(
                text: title,
                fontSize: FontConstant.font_14,
                textColor: ColorConstant.blackColor,
                fontWeight: FontWeightConstant.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  isKeyBordOpen(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom != 0;
  }

  // static void getAudioFile(String msg) async {
  //   var headers = {
  //     "Ocp-Apim-Subscription-Key": "${Constants.microsoft_subscription_key}",
  //     "Content-Type": "application/ssml+xml",
  //     "X-Microsoft-OutputFormat": "audio-16khz-128kbitrate-mono-mp3"
  //   };
  //   var body =
  //   '''<speak xmlns="http://www.w3.org/2001/10/synthesis" xmlns:mstts="http://www.w3.org/2001/mstts" xmlns:emo="http://www.w3.org/2009/10/emotionml" version="1.0" xml:lang="en-US"><voice name="en-US-MichelleNeural"><prosody rate="-20%" pitch="5%">${msg}</prosody></voice></speak>''';
  //
  //   var dio = Dio();
  //   dio.options.headers = headers;
  //   dio.options.method = "POST";
  //   var response = await dio.post(ApiConstant.microsoftAudio, data: body);
  //
  //   print("Response === ${response.statusCode}");
  //   if (response.statusCode == 200) {
  //     // base64Decode(response.data);
  //     // final fileString = 'data:audio/mp3;base64,$base64String';
  //     Directory appDocumentsDirectory =
  //     await getApplicationDocumentsDirectory(); // 1
  //     String appDocumentsPath = appDocumentsDirectory.path; // 2
  //     String filePath = '$appDocumentsPath/${DateTime.now().millisecond}.mpga'; // 3
  //
  //     File file = File(filePath); // 1
  //     file.writeAsString(response.data); // 2
  //     // var audioPlayer = AudioPlayer();
  //     // await audioPlayer.setSourceUrl("https://heartiod.s3.amazonaws.com/audio/1658731718300-phrases.mpga");
  //     // var byte=await rootBundle.load(response.data);
  //     // await audioPlayer
  //     //     .setAudioSource(MyCustomSource(Uint8List.fromList(await file.readAsBytes())));
  //     // audioPlayer.p
  //     // audioPlayer.play();
  //   } else {
  //     // print(response.reasonPhrase);
  //   }
  // }

}