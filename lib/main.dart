import 'package:flutter/material.dart';
import 'package:stroll_test/shared/theme.dart';
import 'package:stroll_test/dependency_injection.dart';
import 'package:stroll_test/shared/navigation_manager.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stroll Test',
      theme: appTheme.light,
      routes: NavigationManager.routes,
      initialRoute: NavigationManager.initial,
      debugShowCheckedModeBanner: false,
    );
  }
}

