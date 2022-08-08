import 'package:dream_stock/screens/ui/auth/otp_verify/otp_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../common/constant/color_constant.dart';
import '../../../../common/constant/font_constant.dart';
import '../../../../common/constant/image_assets.dart';
import '../../../../common/constant/string_constant.dart';
import '../../../../common/widgets/common_widgets.dart';

class OtpVerifyScreen extends StatelessWidget {
  OtpVerifyScreen({Key? key}) : super(key: key);

  final OtpController _otpLogic = OtpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_appBar(context), _content(context)],
      ),
    );
  }

  Widget _appBar(context) {
    return CommonWidgets.commonAppBar(

      actionClick: (){
        Get.back();
      },

      backgroundColor: ColorConstant.selectedLightGreen,
      isHaveImage: true,

      centerImage: ImageAssets.dreamStockWhiteLogo,
      actionIcon: ImageAssets.whiteCloseIcon,
      context: context,
    );
  }

  Widget _content(context) {
    return Column(
      children: [
        ///verifyEmail
        Padding(
          padding:  const EdgeInsets.only(top: 35.0),
          child: CommonWidgets.commonText(
              color: ColorConstant.blackColor,
              text: StringConstant.verifyEmail,
              fontWeight: FontWeightConstant.semi_bold,
              fontSize: 20),
        ),

        ///emailId
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              CommonWidgets.commonText(
                  fontSize: 14,
                  fontFamily: FontFamilyConstant.barlow,
                  color: ColorConstant.greyGradient1,
                  fontWeight: FontWeightConstant.medium,
                  text: StringConstant.enterOtp),
              const SizedBox(
                height: 6,
              ),
              CommonWidgets.commonText(
                  fontSize: 14,
                  fontFamily: FontFamilyConstant.barlow,
                  color: ColorConstant.blackColor,
                  fontWeight: FontWeightConstant.medium,
                  text: StringConstant.userEmail),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        ///verifyImage
        SvgPicture.asset(
            ImageAssets.verifyEmail),
        const SizedBox(height: 24),

        ///otpBox
        // _otpBox2(context),
        ///verify Button
        _verifyButton(context),
        ///resend Button
        _resendButton()

      ],
    );
  }

  Widget _verifyButton(context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: CommonWidgets.commonFilledButton(
        context: context,
          title: StringConstant.verify,
          textColor: ColorConstant.whiteColor,
          color: ColorConstant.selectedLightGreen),
    );
  }

  Widget _otpBox2(context){
    return Obx(() => GestureDetector(
      onTap: (){
      },
      child: PinCodeTextField(
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.blue.shade50,
        enableActiveFill: true,
        // errorAnimationController: _forgotPasswordLogic.,
        controller: _otpLogic.otpState.textEditingController,
        onCompleted: (v) {

        },
        onChanged: (value) {
          // if (kDebugMode) {
          //   print(value);
          // }

          // _otpLogic.otpState.currentText.value = value as int;

        },
        beforeTextPaste: (text) {
          if (kDebugMode) {
            print("Allowing to paste $text");
          }
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        }, appContext: context,
      ),
    ));
  }

  Widget _resendButton(){
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          CommonWidgets.commonText(
          text: StringConstant.resendCode,
          fontWeight: FontWeightConstant.medium,
          color: ColorConstant.selectedLightGreen,
          fontSize: 16,

        ),
          const SizedBox(
            height: 3,
          ),
          Container(height: 1,
          width: 85,
          color: ColorConstant.selectedLightGreen,)
        ],

      ),
    );
  }



}
