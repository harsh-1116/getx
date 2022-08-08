import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
enum IndicatorType { Top, Bottom }


class CustomLineIndicatorBottomNavbarItems extends StatelessWidget {
  final String? icon;
  final String? activeIcon;
  final double? iconSize;
  final String? label;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double unSelectedFontSize;
  final double selectedIconSize;
  final double unselectedIconSize;
  final double selectedFontSize;
  final Color? splashColor;
  final int? currentIndex;
  final int index;
  final Function(int) onTap;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final IndicatorType indicatorType;

   CustomLineIndicatorBottomNavbarItems({
    this.icon,this.activeIcon,
    this.label,
    this.selectedColor,
    this.unSelectedColor,
    this.unSelectedFontSize = 14,
    this.selectedFontSize = 14,
    this.selectedIconSize = 18,
    this.unselectedIconSize = 18,
    this.splashColor,
    this.currentIndex,
    required this.onTap,
    required this.index,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 3,
    this.indicatorType = IndicatorType.Top, this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomTheme = BottomNavigationBarTheme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 7),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: splashColor ?? Theme.of(context).splashColor,
            onTap: () {
              onTap(index);
            },
            child: Container(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 10.0),
              decoration: BoxDecoration(
                border: enableLineIndicator
                    ? Border(top: indicatorType == IndicatorType.Top
                    ? BorderSide(
                  color: currentIndex == index
                      ? selectedColor ??
                      bottomTheme.selectedItemColor!
                      : Colors.transparent,
                  width: lineIndicatorWidth,
                )
                    : const BorderSide(color: Colors.transparent),
                )
                    : null,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  SvgPicture.asset(
                    icon!,
                    height : /*index == 1 ? 10 :*/ currentIndex == index
                        ? selectedIconSize
                        : unselectedIconSize,
                    color: currentIndex == index
                        ? selectedColor ?? bottomTheme.unselectedItemColor
                        : unSelectedColor,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '$label',
                    textAlign: TextAlign.center,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: currentIndex == index
                          ? 10
                          : 10,
                      color: currentIndex == index
                          ? selectedColor ?? bottomTheme.unselectedItemColor
                          : unSelectedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}