import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/init/lang/language_manager.dart';
import '../core/init/lang/locale_keys.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.app_welcome.tr(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            DropdownButton<String>(
              hint: Text(
                LocaleKeys.dropdown_items_select_language.tr(),
                style: const TextStyle(color: Colors.black),
              ),
              icon: const Icon(
                Icons.arrow_drop_down_outlined,
                color: Colors.white,
              ),
              elevation: 16,
              //value: list.first,
              style: const TextStyle(color: Colors.black),
              underline: const SizedBox(),
              onChanged: (String? value) async {
                final locale = FactoryOfMyLocale.create(langMap[value]!);
                context.setLocale(locale);
              },
              items: langMap.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
