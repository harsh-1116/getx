import 'package:flutter/material.dart';
import 'package:dream_stock/common/constant/color_constant.dart';
import 'package:dream_stock/common/constant/font_constant.dart';
import 'package:dream_stock/common/constant/image_assets.dart';
import 'package:dream_stock/common/constant/string_constant.dart';
import 'package:dream_stock/common/widgets/common_widgets.dart';
import 'package:dream_stock/screens/ui/auth/forgot_password/forgot_password_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../otp_verify/otp_view.dart';



class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

    final ForgotPasswordController _forgotPasswordLogic = ForgotPasswordController();

  @override
  Widget build(BuildContext context) {
    print("listView---->dateTime");
    return Scaffold(
      body: Column(
        children: [
          _appBar(context),
          _content(context)

        ],
      ),
    );
  }

  Widget _appBar(context){
    return  CommonWidgets.commonAppBar(
      backClick: (){
        Get.back();
      },
      backgroundColor: ColorConstant.selectedLightGreen,
      isHaveImage: true,
      title: StringConstant.forgotPasswordWithQuestion,
      backIcon:ImageAssets.whiteBackIcon,
      centerImage: ImageAssets.dreamStockWhiteLogo, context: context,

    );
  }

  Widget _content(context){

    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Column(
        children:  [
          ///verifyEmail
          CommonWidgets.commonText(
            color: ColorConstant.blackColor,
            text: StringConstant.forgotPasswordWithQuestion,
            fontWeight: FontWeightConstant.semi_bold,
            fontSize: 20
          ),
          ///emailId
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CommonWidgets.commonText(
              maxLine: 3,
              fontSize: 14,
            fontFamily: FontFamilyConstant.barlow,
            color: ColorConstant.greyGradient1,
            fontWeight: FontWeightConstant.medium,
            text: StringConstant.emailForSentOtp),
          ),
          const SizedBox(height: 20,),
          ///verifyImage
          SvgPicture.asset(
              ImageAssets.forgotPassword),
          const SizedBox(height:24),
          ///otpBox
          // Obx(()=>_otpBox2(context))
          ///enterEmail
          _enterEmail(),
          const SizedBox(height:24),
          ///verify Button
          _sendButton(context)

        ],
      ),
    );
  }

  Widget _enterEmail(){
    return CommonWidgets.commonTextFormField(
      labelText: StringConstant.email,
      obscureText: false,
        fontSize: 14,
      autofocus: false,
      contentPadding: const EdgeInsets.all(15),
      fontWeight: FontWeightConstant.medium,
      textColor: ColorConstant.blackColor,
      textEditingController: _forgotPasswordLogic.forgotPasswordState.textEditingController,
      fontFamily: FontFamilyConstant.barlow,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: SvgPicture.asset(ImageAssets.email,
        width: 16),

      ),

    );
  }

  Widget _sendButton(context){
    return  CommonWidgets.commonFilledButton(
      onclick: (){
        Get.to(()=>OtpVerifyScreen());
      },
      context: context,
        title: StringConstant.send,
        fontFamily: FontFamilyConstant.barlow,
        fontSize: 18,
        fontWeight: FontWeightConstant.medium,
        textColor: ColorConstant.whiteColor,
        color: ColorConstant.selectedLightGreen
    );
  }

  Widget _otpBox(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonWidgets.commonOtpBox(
          filledText: StringConstant.enterOtp,
          selectedBox: true
        ),
        const SizedBox(width: 10,),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: ColorConstant.greyGradient1)
          ),
        ),
        const SizedBox(width: 10,),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: ColorConstant.greyGradient1)
          ),
        ),
        const SizedBox(width: 10,),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: ColorConstant.greyGradient1)
          ),
        ),

      ],
    );
  }



}


