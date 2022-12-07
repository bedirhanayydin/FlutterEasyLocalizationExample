import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_example/view/app_view.dart';
import 'package:flutter/material.dart';

import '../core/init/lang/language_manager.dart';

void main(List<String> args) {
  startApp();
}

Future<void> startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  LanguageManager languageManager = LanguageManager();
  runApp(
    EasyLocalization(
      // DevicePreview for see responsive design in multi-screens
      supportedLocales: languageManager.supportedLocales,
      path: 'assets/lang',
      fallbackLocale: FactoryOfMyLocale.create(MyLanguage.en),
      startLocale: FactoryOfMyLocale.create(langMap['en']),
      // DevicePreview for see responsive design in multi-screens
      child: const AppView(),
    ),
  );
}
