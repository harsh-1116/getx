import 'package:dream_stock/common/constant/color_constant.dart';
import 'package:dream_stock/common/constant/image_assets.dart';
import 'package:dream_stock/common/constant/string_constant.dart';
import 'package:dream_stock/common/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ContestsDetailsView extends StatelessWidget {
  const ContestsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteColor.withOpacity(0.03),
      body: Column(
        children: [
          _appBar(context),
          Content(),

        ],
      )
    );
  }

  Widget _appBar(context){
    return CommonWidgets.commonAppBar(
      isHaveImage: false,
      context: context,
      // containerShadowColor: ColorConstant.blackColor,
      backgroundColor: ColorConstant.whiteColor,
      title: "It Contests",
      actionClick: (){},
      actionIcon: ImageAssets.infoIcon,
      textColor: ColorConstant.blackColor,
      backClick: (){
        Get.back();
      },
      backIcon:ImageAssets.blackBackIcon,

    );
  }

  Widget Content(){
    return Column(
      children: [
      Image.asset(ImageAssets.contestLogo1)
      ],
    );
  }

}


