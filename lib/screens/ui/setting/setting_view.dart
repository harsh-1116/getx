import 'package:dream_stock/common/constant/color_constant.dart';
import 'package:dream_stock/common/constant/font_constant.dart';
import 'package:dream_stock/common/constant/image_assets.dart';
import 'package:dream_stock/screens/ui/auth/forgot_password/forgot_password_view.dart';
import 'package:dream_stock/screens/ui/profile/my_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../common/constant/string_constant.dart';
import '../../../common/widgets/common_widgets.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     toolbarHeight: 50,
      //     backgroundColor: ColorConstant.whiteColor,
      //     elevation: 0,
      //     leading: Container(),
      //     centerTitle: true,
      //     title:Text(StringConstant.settings,style: const TextStyle(
      //         color: ColorConstant.blackColor
      //     ),
      //     )
      // ),
      body: Column(
        children: [
          _appBar(context),
          Expanded(child: _content())
        ],
      ),
    );
  }


  Widget _appBar(context){
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CommonWidgets.commonSmallAppBar(
        backClick: (){
          Get.back();
        },
        isHaveImage: false,
        context: context,
        containerShadowColor: ColorConstant.transperant,
        title: StringConstant.settings,
        textColor: ColorConstant.blackColor,
        backgroundColor: ColorConstant.whiteColor,



      ),
    );
  }

  Widget _content(){
    return SingleChildScrollView(
      child: Column(
        children:  [
          ///Image
          Padding(
            padding: const EdgeInsets.only(top: 30.0,bottom: 60),
            child: SvgPicture.asset(ImageAssets.settingColorImageLogo),
          ),

          ///ListOption
          CommonWidgets.commonIconWithTitle(
            onclick: (){
             Get.to(()=> MyProfileView());
              },
            title: StringConstant.myProfile,
            image: SvgPicture.asset(ImageAssets.greenProfileIcon)
          ),
          CommonWidgets.commonIconWithTitle(
            onclick: (){
              Get.to(()=>ForgotPasswordScreen());
            },
              title: StringConstant.myWallet,
              image: SvgPicture.asset(ImageAssets.myWalletIcon)
          ),
          CommonWidgets.commonIconWithTitle(
              title: StringConstant.changePassword,
              image: SvgPicture.asset(ImageAssets.changePasswordSettingScreen)
          ),
          CommonWidgets.commonIconWithTitle(
              title: StringConstant.privacyPolicy,
              image: SvgPicture.asset(ImageAssets.privacyPolicy)
          ),
          CommonWidgets.commonIconWithTitle(
              title: StringConstant.transaction,
              image: SvgPicture.asset(ImageAssets.transactionIcon)
          ),
          CommonWidgets.commonIconWithTitle(
              title: StringConstant.logout,
              image: SvgPicture.asset(ImageAssets.logoutButton)
          ),
         // GestureDetector(
         //   onTap: (){
         //
         //   },
         //   child: Row(
         //     children: [
         //       SvgPicture.asset(ImageAssets.greenProfileIcon),
         //       const SizedBox(
         //         width: 15,
         //       ),
         //       CommonWidgets.commonText(
         //         text: StringConstant.myProfile,
         //         fontWeight: FontWeightConstant.semi_bold
         //       )
         //     ],
         //   ),
         // )

        ],
      ),
    );
  }
}
