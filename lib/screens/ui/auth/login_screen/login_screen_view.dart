import 'package:dream_stock/common/constant/color_constant.dart';
import 'package:dream_stock/common/constant/font_constant.dart';
import 'package:dream_stock/common/constant/image_assets.dart';
import 'package:dream_stock/common/widgets/common_widgets.dart';
import 'package:dream_stock/screens/ui/auth/forgot_password/forgot_password_view.dart';
import 'package:dream_stock/screens/ui/auth/signup/signup_view.dart';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../common/constant/string_constant.dart';
import '../../bottom_navigation/bottom_navigation_screen.dart';
import '../forgot_password/forgot_password_controller.dart';
import 'login_screen_logic.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  final LoginController _loginLogic = LoginController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          _logoContainer(),
          Expanded(
            child: _loginForm()
          ),
          Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom==0,
              child: bottomText()),
        ],
      ),
    );
  }

  Widget _loginForm(){
    return Form(
      key: _loginLogic.loginState.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.only(top:35,left: 35,right: 35),
        child: SingleChildScrollView(
          child: Column(
            children:  [
              ///sign in
              CommonWidgets.commonText(
                  text: StringConstant.signIn,
                  fontFamily: FontFamilyConstant.barlow,
                  fontWeight: FontWeightConstant.semi_bold,
                  fontSize: 20
              ),
              const SizedBox(height: 30,),
              /// email
              _enterEmail(),
              const SizedBox(height: 20,),
              /// password
              _enterPassword(),
              const SizedBox(height: 20,),
              ///forgot password
              CommonWidgets.commonText(
                onClick: (){
                  Get.to(()=>ForgotPasswordScreen());
                },
                  text: StringConstant.forgotPasswordWithQuestion,
                  fontWeight: FontWeightConstant.medium,
                  fontSize: 14
              ),
              const SizedBox(height: 20,),
              ///sign in button
              CommonWidgets.commonFilledButton(
                context: context,
                  onclick: (){
                  // _loginLogic.doSignIn();
                  Get.to(()=>const BottomNavigationScreen());
                  // _loginLogic.fetchInitialMovies();
                  },
                color: ColorConstant.selectedLightGreen,
                fontWeight: FontWeightConstant.semi_bold,
                fontSize: 17,
                title: StringConstant.signIn,
                textColor: ColorConstant.whiteColor
              ),
            ],
          ),
        ),
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
  

  Widget _enterEmail(){
    return CommonWidgets.commonTextFormField(
      labelText: StringConstant.email,
      obscureText: false,
      autofocus: false,
      fontWeight: FontWeightConstant.medium,
      textColor: ColorConstant.blackColor,
      textEditingController: _loginLogic.loginState.emailController,
      fontFamily: FontFamilyConstant.barlow,
      suffixIcon: SvgPicture.asset(ImageAssets.email,
          ),

    );
  }

  Widget _enterPassword(){
    return CommonWidgets.commonTextFormField(
      labelText: StringConstant.password,
      obscureText: true,
      autofocus: false,
      fontWeight: FontWeightConstant.medium,
      textColor: ColorConstant.blackColor,
      textEditingController: _loginLogic.loginState.passwordController,
      fontFamily: FontFamilyConstant.barlow,
      suffixIcon: SvgPicture.asset(ImageAssets.passWordIcon,
        ),

    );
  }

  Widget bottomText(){
    return Padding(
      padding: const EdgeInsets.only(top: 16.0,bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonWidgets.commonText(
            onClick: (){
              Get.to(()=>
                SignUpScreen()
              );
            },
              fontSize: 14,
              fontWeight: FontWeightConstant.medium,
              color: ColorConstant.blackColor,
              text: StringConstant.donTHaveAccount
          ),
          const SizedBox(width: 7,),
          CommonWidgets.commonText(
              onClick: (){
                Get.to(()=>
                    SignUpScreen()
                );
              },
              fontSize: 16,
              fontWeight: FontWeightConstant.semi_bold,
              color: ColorConstant.selectedLightGreen,
              text: StringConstant.signUp
          )

        ],
      ),
    );
  }

}
