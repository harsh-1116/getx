import 'package:dream_stock/common/constant/color_constant.dart';
import 'package:dream_stock/common/constant/font_constant.dart';
import 'package:dream_stock/common/constant/image_assets.dart';
import 'package:dream_stock/common/constant/string_constant.dart';
import 'package:dream_stock/common/widgets/common_widgets.dart';
import 'package:dream_stock/screens/ui/history/history_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../auth/login_screen/login_screen_view.dart';
import '../auth/signup/signup_controller.dart';
import '../contests/contests_view.dart';
import '../edit_profile/profile_view.dart';
import '../profile/my_profile_view.dart';

class HistoryView extends StatelessWidget {
  HistoryView({Key? key}) : super(key: key);

  final HistoryController historyController = HistoryController();

  late final state = historyController.historyState;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorConstant.greyFont.withOpacity(0.1),
        appBar: AppBar(
          toolbarHeight: 50,
        backgroundColor: ColorConstant.whiteColor,
         elevation:1,
         leading: Container(),
          bottom:  TabBar(

            indicatorColor: ColorConstant.selectedLightGreen,
            unselectedLabelColor: ColorConstant.greyFont,
            unselectedLabelStyle: CommonWidgets.commonTextStyle(
              // fontSize: 15,
              // color: ColorConstant.selectedLightGreen,
                color: ColorConstant.selectedLightGreen,
                fontWeight: FontWeightConstant.semi_bold

            ),
            labelColor: ColorConstant.selectedLightGreen,
            labelStyle: CommonWidgets.commonTextStyle(
              color: ColorConstant.selectedLightGreen,
              fontWeight: FontWeightConstant.semi_bold
            ),
            tabs:  const [
              // Tab(
              //   // text: StringConstant.daily,
              //   child: Column(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children:  [
              //       CommonWidgets.commonText(
              //         text: StringConstant.daily
              //       ),
              //       SizedBox(height: 10,),
              //       Transform.translate(
              //         offset: Offset(0,2),
              //         child: Container(
              //           height: 2.2,
              //           width:100,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             color: ColorConstant.selectedLightGreen,
              //           ),
              //
              //         ),
              //       )
              //     ],
              //   ),),
              // Tab(
              //   // text: StringConstant.daily,
              //   child: Column(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children:  [
              //       CommonWidgets.commonText(
              //           text: StringConstant.daily
              //       ),
              //       SizedBox(height: 10,),
              //       Transform.translate(
              //         offset: Offset(0,2),
              //         child: Container(
              //           height: 2.2,
              //           width:100,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             color: ColorConstant.selectedLightGreen,
              //           ),
              //
              //         ),
              //       )
              //     ],
              //   ),),
              Tab(text: StringConstant.daily, ),
              Tab(text: StringConstant.weekly, ),
              Tab(text: StringConstant.monthly, ),
            ],
          ),
          centerTitle: true,
          title:Text(StringConstant.history,style: const TextStyle(
            color: ColorConstant.blackColor
          ),
          )
        ),
        body: TabBarView(
          // viewportFraction: 10,
          children: <Widget>[
            dailyContentList(),  weeklyContentList(), monthlyContentList(),
          ],
        ),
      ),
    );
  }


  // Widget dailyContentList(){
  //
  //
  //   return Expanded(
  //     child: ListView.builder(
  //         shrinkWrap: true,
  //         itemCount:6,
  //         primary: true,
  //         itemBuilder: (context, index) {
  //       return  Padding(
  //         padding: const EdgeInsets.only(top: 8.0,left: 15,right: 15),
  //         child: Card(
  //           elevation: 2,
  //           shadowColor: ColorConstant.greyFont,
  //           child: Container(
  //             height: 125,
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //                 borderRadius: BorderRadius.circular(6)
  //             ),
  //             child: Column(
  //               children: [
  //                 Padding(
  //                   padding: EdgeInsets.all(15),
  //                   child: Column(
  //                   crossAxisAlignment : CrossAxisAlignment.start,
  //                   children: [
  //                     CommonWidgets.commonText(
  //                       text: StringConstant.confirmPassword,
  //                       color: ColorConstant.blackColor,
  //                       fontSize: 16,
  //                       fontWeight: FontWeightConstant.semi_bold
  //                     ),
  //                     const SizedBox(
  //                       height: 12,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             CommonWidgets.commonText(
  //                               text: StringConstant.prizePool,
  //                               color: ColorConstant.greyFont,
  //                               fontWeight: FontWeightConstant.medium,
  //                               fontSize: 14,
  //                               fontFamily: FontFamilyConstant.barlow
  //                             ),
  //
  //                             CommonWidgets.commonText(
  //                                 fontFamily: FontFamilyConstant.barlow,
  //                                 fontSize: 18,
  //                                 fontWeight: FontWeightConstant.medium,
  //                                 color: ColorConstant.blackColor,
  //                                 text: "₹ ${"dynamic"}"
  //                             ),
  //                           ],
  //                         ),
  //                         Row(
  //                           children: [
  //                             CommonWidgets.commonText(
  //                                 fontFamily: FontFamilyConstant.barlow,
  //                                 fontSize: 14,
  //                                 fontWeight: FontWeightConstant.medium,
  //                                 color: ColorConstant.greyFont,
  //                                 text: StringConstant.entry
  //                             ),
  //
  //                             CommonWidgets.commonText(
  //                                 fontFamily: FontFamilyConstant.barlow,
  //                                 fontSize: 16,
  //                                 fontWeight: FontWeightConstant.medium,
  //                                 color: ColorConstant.blackColor,
  //                                 text: "₹ ${"dynamic"}"
  //                             ),
  //
  //                           ],
  //                         )
  //                       ],
  //                     ),
  //
  //
  //                   ]
  //           ),
  //                 ),
  //                 const Divider(height: 2,
  //                 color: ColorConstant.greyFont,),
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 10,right:10,top: 13),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Row(
  //                         children: [
  //                           SvgPicture.asset(ImageAssets.calenderIcon),const SizedBox(width: 7,),
  //                           CommonWidgets.commonText(
  //                             text: state.dateFormatter(),
  //                             fontSize: 14
  //                           )
  //                         ],
  //                       ),
  //                       Transform.translate(
  //                         offset: const Offset(-9,0),
  //                         child: CommonWidgets.commonText(
  //                           text: StringConstant.betterLuck,
  //                           fontWeight: FontWeightConstant.bold,
  //                           fontSize: 14,
  //                           color: ColorConstant.redFont
  //                         ),
  //                       ),
  //                       Row(
  //                         children: [
  //                           CommonWidgets.commonText(
  //                             text: "#",
  //                             fontWeight: FontWeightConstant.bold,
  //                             fontSize: 13,
  //                             color: ColorConstant.greyFont
  //                           ),
  //                           CommonWidgets.commonText(
  //                             text: "1820",
  //                             fontWeight: FontWeightConstant.bold,
  //                             fontSize: 13,
  //                             color: ColorConstant.blackColor
  //                           ),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         )
  //       );
  //     }),
  //   );
  // }

  Widget dailyContentList(){
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount:6,
          primary: true,
          itemBuilder: (context, index) {
            return CommonWidgets.commonCardOfList(
                cardHeight: 125,
                cardRadius: 8,
                containerColor: ColorConstant.whiteColor,
                contentPadding: 15,
                cardColor: ColorConstant.transperant,
                cardShadowColor: ColorConstant.greyGradient1,
                headerText: StringConstant.confirmPassword,
                headerFontSize: 18,
                headerColor: ColorConstant.blackColor,
                headerFontWeight: FontWeightConstant.semi_bold,
                title1Text: StringConstant.prizePool,
                title1Color: ColorConstant.greyGradient1,
                title1FontSize: 14,
                title2Text: "${StringConstant.rupee} Dynamic",
                title2FontSize: 16,
                title3Text: StringConstant.entry,
                title3Color: ColorConstant.greyGradient1,
                title4Text: "Dynamic",
                title4FontWeight: FontWeightConstant.semi_bold,
                date: state.dateFormatter(),
                dateFontSize: 14,
                subTitle1Text:StringConstant.betterLuck,
                subTitle1Color: ColorConstant.redFont,
                subTitle1FontWeight: FontWeightConstant.semi_bold,
                subTitle2Text: "#",
                subTitle2Color: ColorConstant.greyGradient1,
                subTitle2FontWeight: FontWeightConstant.medium,
                subTitle3Text: "476",
                subTitle3Color: ColorConstant.blackColor,
                subTitle3FontWeight: FontWeightConstant.semi_bold


            );
          }),
    );
  }

  Widget weeklyContentList(){
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount:6,
          primary: true,
          itemBuilder: (context, index) {
            return CommonWidgets.commonCardOfList(
                cardHeight: 128,
                cardRadius: 8,
                containerColor: ColorConstant.whiteColor,
                contentPadding: 15,
                cardColor: ColorConstant.transperant,
                cardShadowColor: ColorConstant.greyGradient1,
                headerText: StringConstant.confirmPassword,
                headerFontSize: 18,
                headerColor: ColorConstant.blackColor,
                headerFontWeight: FontWeightConstant.semi_bold,
                title1Text: StringConstant.prizePool,
                title1Color: ColorConstant.greyGradient1,
                title1FontSize: 14,
                title2Text: "${StringConstant.rupee} Dynamic",
                title2FontSize: 16,
                title3Text: StringConstant.entry,
                title3Color: ColorConstant.greyGradient1,
                title4Text: "Dynamic",
                title4FontWeight: FontWeightConstant.semi_bold,
                date: state.dateFormatter(),
                dateFontSize: 14,
                subTitle1Text:StringConstant.youWon,
                subTitle1Color: ColorConstant.greenFont,
                subTitle1FontWeight: FontWeightConstant.semi_bold,
                subTitle2Text: "#",
                subTitle2Color: ColorConstant.greyGradient1,
                subTitle2FontWeight: FontWeightConstant.medium,
                subTitle3Text: "476",
                subTitle3Color: ColorConstant.blackColor,
                subTitle3FontWeight: FontWeightConstant.semi_bold


            );
          }),
    );
  }

  Widget monthlyContentList(){
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount:6,
          primary: true,
          itemBuilder: (context, index) {
        return CommonWidgets.commonCardOfList(
          cardHeight: 125,
          cardRadius: 8,
          containerColor: ColorConstant.whiteColor,
          contentPadding: 15,
          cardColor: ColorConstant.transperant,
          cardShadowColor: ColorConstant.greyGradient1,
          headerText: StringConstant.confirmPassword,
          headerFontSize: 18,
          headerColor: ColorConstant.blackColor,
          headerFontWeight: FontWeightConstant.semi_bold,
          title1Text: StringConstant.prizePool,
          title1Color: ColorConstant.greyGradient1,
          title1FontSize: 14,
          title2Text: "${StringConstant.rupee} Dynamic",
            title2FontSize: 16,
          title3Text: StringConstant.entry,
          title3Color: ColorConstant.greyGradient1,
          title4Text: "Dynamic",
          title4FontWeight: FontWeightConstant.semi_bold,
          date: state.dateFormatter(),
          dateFontSize: 14,
            subTitle1Text:StringConstant.betterLuck,
          subTitle1Color: ColorConstant.redFont,
          subTitle1FontWeight: FontWeightConstant.semi_bold,
          subTitle2Text: "#",
          subTitle2Color: ColorConstant.greyGradient1,
          subTitle2FontWeight: FontWeightConstant.medium,
          subTitle3Text: "476",
          subTitle3Color: ColorConstant.blackColor,
          subTitle3FontWeight: FontWeightConstant.semi_bold


        );
      }),
    );
  }

  Widget tabBarView() {
    return const TabBar(tabs: <Tab>[
      Tab(text: "NEW"),
      Tab(text: "HOTELS"),
      Tab(text: "FOOD"),
      Tab(text: "FUN"),
    ]);
  }
}


