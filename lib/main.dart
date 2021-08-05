import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:traveloka_clone/dictionaries/app_dictionary.dart';
import 'package:traveloka_clone/locator/locator.dart';
import 'package:traveloka_clone/services/navigation/app_router.dart';
import 'package:traveloka_clone/utils/project_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppDictionary.appName,
      theme: projectTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.main,
      getPages: AppRouter.routeList,
    );
  }
}
