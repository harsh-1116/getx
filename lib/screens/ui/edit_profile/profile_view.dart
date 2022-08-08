import 'package:dream_stock/common/widgets/common_widgets.dart';
import 'package:dream_stock/screens/ui/edit_profile/profile_screen_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/constant/color_constant.dart';
import '../../../../common/constant/font_constant.dart';
import '../../../../common/constant/image_assets.dart';
import '../../../../common/constant/string_constant.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final ProfileLogic _profileLogic = ProfileLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appBar(context),
          Expanded(child: _content(context)),
          Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
              child: CommonWidgets.commonFilledButton(
                  color: ColorConstant.selectedLightGreen,
                  title: StringConstant.update,
                  fontSize: 18,
                  fontWeight: FontWeightConstant.medium,
                  textColor: ColorConstant.whiteColor, context: context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(context) {
    return Padding(
        padding: const EdgeInsets.only(left: 35, right: 35,top: 35),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorConstant.selectedLightGreen.withOpacity(0.1), width: 10), borderRadius: BorderRadius.circular(65)),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(65),
                    ),
                    child: Image.asset(ImageAssets.userProfileMediumPng,
                        fit: BoxFit.cover),
                  ),
                ),
              ),

              Container(padding:EdgeInsets.only(top: 60),child: _enterName()),

              Container(padding:EdgeInsets.only(top: 25),child: _enterUserName()),

              Container(padding:EdgeInsets.only(top: 25),child: _enterDOB()),

              Container(padding:EdgeInsets.only(top: 25),child: _enterEmail())
            ],
          ),
        ));
  }

  Widget _enterName() {
    return CommonWidgets.commonTextFormField(
      labelText: StringConstant.name,
      obscureText: false,
      autofocus: false,
      fontWeight: FontWeightConstant.medium,
      textColor: ColorConstant.blackColor,
      textEditingController: _profileLogic.profileState.nameController,
      fontFamily: FontFamilyConstant.barlow,
      suffixIcon: SvgPicture.asset(
        ImageAssets.signUpUsername,
      ),
    );
  }

  Widget _enterUserName() {
    return CommonWidgets.commonTextFormField(
      labelText: StringConstant.userName,
      obscureText: false,
      autofocus: false,
      fontWeight: FontWeightConstant.medium,
      textColor: ColorConstant.blackColor,
      textEditingController: _profileLogic.profileState.userNameController,
      fontFamily: FontFamilyConstant.barlow,
      suffixIcon: SvgPicture.asset(
        ImageAssets.signUpUsername,
      ),
    );
  }

  Widget _enterDOB() {
    return CommonWidgets.commonTextFormField(
      labelText: StringConstant.dob,
      obscureText: false,
      autofocus: false,
      fontWeight: FontWeightConstant.medium,
      textColor: ColorConstant.blackColor,
      textEditingController: _profileLogic.profileState.dobController,
      fontFamily: FontFamilyConstant.barlow,
      suffixIcon: SvgPicture.asset(
        ImageAssets.dateOfBirth,
      ),
    );
  }

  Widget _enterEmail() {
    return CommonWidgets.commonTextFormField(
      labelText: StringConstant.email,
      obscureText: false,
      autofocus: false,
      fontWeight: FontWeightConstant.medium,
      textColor: ColorConstant.blackColor,
      textEditingController: _profileLogic.profileState.emailController,
      fontFamily: FontFamilyConstant.barlow,
      suffixIcon: SvgPicture.asset(
        ImageAssets.email,
      ),
    );
  }

  Widget _appBar(context) {
    return CommonWidgets.commonAppBar(
      backClick: (){
        Get.back();
      },
      isHaveImage: false,
      title: StringConstant.editProfile,
      backIcon: ImageAssets.blackBackIcon,
      centerImage: ImageAssets.dreamStockWhiteLogo,
      context: context,
    );
  }
}
