import 'package:dream_stock/common/constant/font_constant.dart';
import 'package:dream_stock/common/constant/string_constant.dart';
import 'package:dream_stock/common/widgets/common_widgets.dart';
import 'package:dream_stock/screens/ui/auth/login_screen/login_screen_view.dart';
import 'package:dream_stock/screens/ui/auth/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/constant/color_constant.dart';
import '../../../../common/constant/image_assets.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);

  final SignupController _signupLogic = SignupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _logoContainer(),
          Expanded(child: _signUpForm(context)),


        ],
      ),
    );
  }

  Widget _logoContainer(){
    return   Container(
      color: ColorConstant.selectedLightGreen,
      alignment: Alignment.center,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: SvgPicture.asset(ImageAssets.dreamStockLogo),
      ),
    );
  }

  Widget _signUpForm(context){
    return Form(
      key: _signupLogic.signUpState.signUpFormKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              CommonWidgets.commonText(
                  text: StringConstant.signUp,
                fontSize: 20,
                color: ColorConstant.blackColor,
                fontWeight: FontWeightConstant.semi_bold,

              ),
              Container(
                  margin: const EdgeInsets.only(top: 35),
                  child: CommonWidgets.commonTextFormField(

                    labelText: StringConstant.name,
                    suffixIcon: SvgPicture.asset(ImageAssets.signUpUsername),
                    fontWeight: FontWeightConstant.medium,
                    textColor: ColorConstant.blackColor,
                    textEditingController: _signupLogic.signUpState.nameController,

                  )),
              Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: CommonWidgets.commonTextFormField(
                    labelText: StringConstant.userName,
                    suffixIcon: SvgPicture.asset(ImageAssets.signUpUsername),
                    fontWeight: FontWeightConstant.medium,
                    textColor: ColorConstant.blackColor,
                    textEditingController: _signupLogic.signUpState.userNameController,

                  )),
              Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: CommonWidgets.commonTextFormField(
                    labelText: StringConstant.dob,
                    suffixIcon: SvgPicture.asset(ImageAssets.dateOfBirth),
                    fontWeight: FontWeightConstant.medium,
                    textColor: ColorConstant.blackColor,
                    textEditingController: _signupLogic.signUpState.dobController,

                  )),
              Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: CommonWidgets.commonTextFormField(
                    labelText: StringConstant.emailAddress,
                    suffixIcon: SvgPicture.asset(ImageAssets.email),
                    fontWeight: FontWeightConstant.medium,
                    textColor: ColorConstant.blackColor,
                    textEditingController: _signupLogic.signUpState.emailController,

                  )),
              Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: CommonWidgets.commonTextFormField(
                    labelText: StringConstant.password,
                    suffixIcon: SvgPicture.asset(ImageAssets.passWordIcon),
                    fontWeight: FontWeightConstant.medium,
                    textColor: ColorConstant.blackColor,
                    textEditingController: _signupLogic.signUpState.passwordController,

                  )),
              Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: CommonWidgets.commonTextFormField(
                    labelText: StringConstant.confirmPassword,
                    suffixIcon: SvgPicture.asset(ImageAssets.passWordIcon),
                    fontWeight: FontWeightConstant.medium,
                    textColor: ColorConstant.blackColor,
                    textEditingController: _signupLogic.signUpState.confirmPasswordController,

                  )),
              Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: CommonWidgets.commonTextFormField(
                    labelText: StringConstant.promoCode,
                    suffixIcon: SvgPicture.asset(ImageAssets.promoCodeIcon),
                    fontWeight: FontWeightConstant.medium,
                    textColor: ColorConstant.blackColor,
                    textEditingController: _signupLogic.signUpState.promoCodeController,

                  )),
              Container(
                margin:  EdgeInsets.only(top: 15),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(ImageAssets.checkedBox),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text.rich(
                        TextSpan(
                        text: StringConstant.iHaveReadAndAgree,
                        style: TextStyle(

                          fontSize: 14,
                          fontWeight: FontWeightConstant.semi_bold
                        ),
                        children: [
                          TextSpan(
                          text:  StringConstant.termAndCondition,style: TextStyle(


                          color: ColorConstant.selectedLightGreen,
                          letterSpacing: 0,
                            shadows: [
                              Shadow(
                                  color: Colors.transparent,
                                  offset: Offset(0, -5))
                            ],

                          decorationThickness: 2,
                          decorationStyle: TextDecorationStyle.solid,

                          decoration: TextDecoration.underline,
                        )

                          )


                        ]
                    )),



                  ],
                ),
              ),
              signUpButton(context),

              bottomText()
            ],
          ),
        ),
      ),
    );
  }

  Widget signUpButton(context){
    return CommonWidgets.commonFilledButton(
        context: context,
        topPadding: 25,
        onclick: (){

        },
        textColor: ColorConstant.whiteColor,
        fontSize: 17,
        fontWeight: FontWeightConstant.medium,
        title: StringConstant.signUp,
        color: ColorConstant.selectedLightGreen,
        text: StringConstant.signUp
    );
  }

   Widget bottomText(){
     return Padding(
       padding: const EdgeInsets.only(top: 20.0,),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           CommonWidgets.commonText(
               fontSize: 14,
               fontWeight: FontWeightConstant.medium,
               color: ColorConstant.blackColor,
               text: StringConstant.alreadyHaveAccount
           ),
           const SizedBox(width: 7,),
           CommonWidgets.commonText(
             onClick: (){
               Get.to(()=>const LoginScreen());
             },

               fontSize: 16,
               fontWeight: FontWeightConstant.semi_bold,
               color: ColorConstant.selectedLightGreen,
               text: StringConstant.signIn
           )

         ],
       ),
     );
   }
}
