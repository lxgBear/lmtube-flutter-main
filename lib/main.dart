import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/global/binding.dart';
import 'package:mobile/http/net_options.dart';
import 'package:mobile/models/entity_factory.dart';
import 'package:mobile/routes.dart';
import 'package:mobile/styles/theme.dart';

void main() {
  NetOptions.instance
      .setBaseUrl("http://localhost:2335/")
      .setEntityFactory(HEntityFactory.getInstance())
      .setConnectTimeout(const Duration(milliseconds: 3000))
      .create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: LocaleKeys.app.tr,
      getPages: HRoutes.getPages,
      initialRoute: HRoutes.main,
      initialBinding: GlobalBinding(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("zh", "CN"),
      translationsKeys: AppTranslation.translations,
      theme: HThemeData.lightThemeData,
      darkTheme: HThemeData.darkThemeData,
      themeMode: ThemeMode.system,
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
    );
  }
}
