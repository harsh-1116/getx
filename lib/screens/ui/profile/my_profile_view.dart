import 'package:dream_stock/common/constant/color_constant.dart';
import 'package:dream_stock/common/constant/font_constant.dart';
import 'package:dream_stock/common/constant/image_assets.dart';
import 'package:dream_stock/common/constant/string_constant.dart';
import 'package:dream_stock/common/widgets/common_widgets.dart';
import 'package:dream_stock/screens/ui/edit_profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _appBar(context),
                _content(context),
                const SizedBox(
                  height: 35,
                ),

                // _profileDetails(context)
              ],
            ),
          ),
          _profileDetails(context),
        ],
      ),
    );
  }

  Widget _profileDetails(context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonWidgets.commonText(
              text: StringConstant.email,
              color: ColorConstant.greyFont,
              fontSize: 14,
              fontFamily: FontFamilyConstant.barlow),
          CommonWidgets.commonText(
              text: "ajay.tristate@gmail.com",
              color: ColorConstant.blackColor,
              fontSize: 16,
              fontFamily: FontFamilyConstant.barlow),
        ],
      ),
    );
  }

  Widget _content(context) {
    return Padding(
      padding: EdgeInsets.only(left: 35, right: 35, top: 35),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorConstant.selectedLightGreen.withOpacity(0.1),
                      width: 10),
                  borderRadius: BorderRadius.circular(65)),
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
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonWidgets.commonText(
                      text: "Nirali Patel",
                      color: ColorConstant.blackColor,
                      fontSize: 20,
                      fontFamily: FontFamilyConstant.barlow),
                  const SizedBox(
                    height: 6,
                  ),
                  CommonWidgets.commonText(
                      text: "nirali123",
                      color: ColorConstant.greyFont,
                      fontSize: 16,
                      fontFamily: FontFamilyConstant.barlow),

                ],
              ),
            ),
            //  _profileDetails(context)
          ],
        ),
      ),
    );
  }

  Widget _appBar(context) {
    return CommonWidgets.commonAppBar(
      backClick: (){
        Get.back();
      },
      actionIcon: ImageAssets.editPencil,
      isHaveImage: false,
      title: StringConstant.myProfile,
      backIcon: ImageAssets.blackBackIcon,
      context: context,
      actionClick: (){
        Get.to(()=>ProfileView());
      }
    );
  }
}
