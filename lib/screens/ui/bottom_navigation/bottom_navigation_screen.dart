import 'package:dream_stock/common/constant/color_constant.dart';
import 'package:dream_stock/common/constant/image_assets.dart';
import 'package:dream_stock/common/constant/string_constant.dart';
import 'package:dream_stock/common/widgets/common_widgets.dart';
import 'package:dream_stock/screens/ui/bottom_navigation/bottom_navigation_controller.dart';
import 'package:dream_stock/screens/ui/setting/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../history/history_view.dart';

import '../home_screen/home_view.dart';
import 'bottomNavigation_state.dart';



class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  final BottomNavigationController  bottomNavigationController = BottomNavigationController();
  late BottomNavigationState state = bottomNavigationController.bottomNavigationState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  final List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    HistoryView(),
    SettingView()
  ];


  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(state.selectedIndex.value),
        ),
        bottomNavigationBar: BottomNavigationBar(

          mouseCursor: SystemMouseCursors.move,
          currentIndex: state.selectedIndex.value,
          unselectedLabelStyle:  const TextStyle(
              fontSize: 0,
              color: Colors.white
          ),
          selectedItemColor: ColorConstant.selectedLightGreen,
          selectedIconTheme:  const IconThemeData(
              color: ColorConstant.selectedLightGreen
          ),
          elevation:25,
          selectedLabelStyle:  TextStyle(
              color: state.selectedIndex.value == 0 ? ColorConstant.selectedLightGreen : ColorConstant.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 0
          ),
          type: BottomNavigationBarType.fixed,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          // unselectedItemColor: Colors.grey,
          enableFeedback: false,
          showSelectedLabels: false,
          showUnselectedLabels: true,
          onTap: (index){
            state.selectedIndex.value = index;
          },

          backgroundColor: ColorConstant.whiteColor,
          items:   <BottomNavigationBarItem>[
            BottomNavigationBarItem(

              icon:  Transform.translate(
                offset: Offset(0,4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    SvgPicture.asset(ImageAssets.homeGreyIcon,
                      color: state.selectedIndex.value == 0 ?
                      ColorConstant.selectedLightGreen :
                      ColorConstant.greyBackground,),
                    Text(
                      StringConstant.home,style: TextStyle(
                      fontSize: 12,
                      color: state.selectedIndex.value == 0 ? ColorConstant.selectedLightGreen : ColorConstant.greyBackground,
                    ),),
                    Transform.translate(
                      offset: Offset(0,-12),
                      child: Text(".",style: TextStyle(
                        fontSize: 24,fontWeight: FontWeight.bold,
                        color: state.selectedIndex.value == 0 ? ColorConstant.selectedLightGreen : Colors.white,
                      ),),
                    )
                  ],
                ),
              ),
              label: "",
              // SvgPicture.asset(ImageAssets.home_icon,height: 25,width: 25,),
              tooltip: StringConstant.home,
            ),
            BottomNavigationBarItem(
              icon: Transform.translate(
                offset: Offset(0,4),
                child: Column(
                  children: [
                    SvgPicture.asset(ImageAssets.historyIcon, color: state.selectedIndex.value == 1 ? ColorConstant.selectedLightGreen : ColorConstant.greyBackground,),
                    Text(
                      StringConstant.history,style: TextStyle(
                      fontSize: 12,
                      color: state.selectedIndex.value == 1 ? ColorConstant.selectedLightGreen : Colors.grey,
                    ),),
                    Transform.translate(
                      offset: Offset(0,-12),
                      child: Text(".",style: TextStyle(
                        fontSize: 24,fontWeight: FontWeight.bold,
                        color: state.selectedIndex.value == 1 ? ColorConstant.selectedLightGreen : Colors.white,
                      ),),
                    )
                  ],
                ),
              ),
              // SvgPicture.asset(ImageAssets.history_icon,height: 25,width: 25,),
              label: "",
              tooltip: StringConstant.history,
            ),
            BottomNavigationBarItem(

              icon:  Transform.translate(
                offset: Offset(0,4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    SvgPicture.asset(ImageAssets.settingsIcon, color: state.selectedIndex.value == 2 ? ColorConstant.selectedLightGreen : ColorConstant.greyBackground,),
                    Text(
                      StringConstant.settings,style: TextStyle(
                      fontSize: 12,
                      color: state.selectedIndex.value == 2 ? ColorConstant.selectedLightGreen : ColorConstant.greyBackground,
                    ),),
                    Transform.translate(
                      offset: Offset(0,-12),
                      child: Text(".",style: TextStyle(
                        fontSize: 24,fontWeight: FontWeight.bold,
                        color: state.selectedIndex.value == 2 ? ColorConstant.selectedLightGreen : Colors.white,
                      ),),
                    )
                  ],
                ),
              ),
              label: "",
              // SvgPicture.asset(ImageAssets.home_icon,height: 25,width: 25,),
              tooltip: StringConstant.home,
            ),

          ],



        )
      ),
    );
  }
}

Widget showIndicator(bool show) {
  return show ? const Padding(padding: EdgeInsets.only(top: 4),
    child: Icon(Icons.brightness_1, size: 5, color: Colors.white,),)
      : const SizedBox();
}