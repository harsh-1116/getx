import 'package:dream_stock/screens/ui/contests/contests_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/constant/color_constant.dart';
import '../../../common/constant/image_assets.dart';
import '../../../common/constant/string_constant.dart';
import '../../../common/widgets/common_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,
          elevation: 0,
          backgroundColor: ColorConstant.whiteColor,),
        backgroundColor: ColorConstant.greyFont.withOpacity(0.03),
        body: Column(
          children: [
            _appBar(context),
            contestsList()
          ],
        )
    );
  }

  Widget _appBar(context){
    return CommonWidgets.commonSmallAppBar(
      isHaveImage: false,
      context: context,
      containerShadowColor: ColorConstant.blackColor,
      backgroundColor: ColorConstant.whiteColor,
      title: StringConstant.todaySContests,
      textColor: ColorConstant.blackColor,
      backClick: (){
        Get.back();
      },
      backIcon:ImageAssets.blackBackIcon,

    );
  }

  Widget contestsList(){
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder:(context, index) {
          return  CommonWidgets.commonCardOfListWithButton(
            onClick: (){
              Get.to(()=>ContestsDetailsView());
            },
              headerText: "Contests",
              contentPadding: 15,
              cardRadius: 10,cardHeight: 120,
              cardShadowColor: ColorConstant.blackColor,
              cardColor: ColorConstant.transperant,
              containerColor: ColorConstant.whiteColor,
              title1Text: StringConstant.prizePool,title1Color: ColorConstant.greyGradient1,
              title2Text: "${StringConstant.rupee}  Dynamic",
              title2FontSize: 16,
              title3Text: StringConstant.entry,
              title3FontSize: 15,

              title3Color: ColorConstant.greyGradient1,
              title4ButtonColor: ColorConstant.selectedLightGreen,
              title4ButtonRadius: 5,title4buttonWidth: 70,title4ButtonHeight: 35,
              title4ButtonFontColor: ColorConstant.whiteColor,
            rank: "500",rankFontSize: 15,outOfRank: "1000",
              subTitle3Text: "2h :34m",
              timerImage:SvgPicture.asset(ImageAssets.clockIcon),rankColor: ColorConstant.redFont,subTitle1Text: "65%",rankImage: SvgPicture.asset(ImageAssets.trophyIcon)
          );
        }),
    );
  }
}