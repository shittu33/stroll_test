import 'package:flutter/material.dart';
import 'package:stroll_test/generated/assets.dart';
import 'package:stroll_test/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stroll_test/features/home_page/presentation/view_model/card_view_model.dart';
import 'package:stroll_test/features/card/presentation/screen/card_screen.dart';
import 'package:stroll_test/shared/data/model/favorite_option_response_model.dart';
import 'package:stroll_test/shared/constants.dart';
import 'package:stroll_test/shared/extensions.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedPageIndex = context
        .select<CardViewModel, int>((CardViewModel vm) => vm.selectedPage);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      SizedBox(
          height: double.infinity,
          child: IndexedStack(index: selectedPageIndex, children: [
            Stack(
              children: [
                const CardScreen(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ])),
      Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
            height: 80,
            child: BottomNavigationBar(
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              enableFeedback: false,
              useLegacyColorScheme: false,
              currentIndex: selectedPageIndex,
              onTap: (value) {
                context.read<CardViewModel>().selectedPage = value;
              },
              selectedItemColor: appColor.primary,
              unselectedItemColor: appColor.greyText,
              backgroundColor: Colors.transparent,
              iconSize: 28,
              items: [
                (icon: Assets.svgIcOptionCard, badge: ""),
                (icon: Assets.svgIcOptionFire, badge: "9"),
                (icon: Assets.svgIcOptionChat, badge: "11"),
                (icon: Assets.svgIcPerson, badge: ""),
              ].asMap().entries.map((entry) {
                final value = entry.value;

                return BottomNavigationBarItem(
                  label: 'Card',
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SvgPicture.asset(
                      value.icon.trimAssetPath,
                      height: 28,
                      width: 28,
                      color: selectedPageIndex == entry.key
                          ? appColor.primary
                          : appColor.greyText,
                    ),
                  ),
                );
              }).toList(),
            )),
      )
    ]));
  }
}
