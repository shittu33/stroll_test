import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stroll_test/dependency_injection.dart';
import 'package:stroll_test/features/home_page/presentation/view_model/card_view_model.dart';
import 'package:stroll_test/features/home_page/presentation/screen/home_page_screen.dart';

class NavigationManager {
  static const String initial = "/";
  static const String bonFire = "bon-fire";
  static const String chat = "chat";
  static const String profile = "profile";

  static Map<String, Widget Function(BuildContext context)> routes = {
    initial: (context) => ChangeNotifierProvider(
        create: (BuildContext context) => getIt<CardViewModel>(),
        child: const HomeScreen()),
    bonFire: (context) =>  Container(),
    chat: (context) =>  Container(),
    profile: (context) =>  Container(),
  };

  static Future navigateTo(
    BuildContext context,
    name, {
    bool replace = false,
  }) {
    if (replace) {
      return Navigator.of(context).popAndPushNamed(name);
    } else {
      return Navigator.of(context).pushNamed(name);
    }
  }
}
