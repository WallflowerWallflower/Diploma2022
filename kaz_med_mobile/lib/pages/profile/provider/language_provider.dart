import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/shared/size_config.dart';

class LanguageProvider extends BaseBloc {
  Size? size;
  List<String> langs = ["Қазақ тілі", "English", "Русский"];

  String langGroupValue = "";
  Locale? _locale;

  init(BuildContext context) {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    //check Locale and set group value
    setInitCurrentLang(context);
    setLoading(false);
  }

  setInitCurrentLang(BuildContext context) {
    switch (EasyLocalization.of(context)!.currentLocale!.languageCode) {
      case "en":
        setGroupedLangValue(langs[1]);

        break;
      case "kk":
        setGroupedLangValue(langs[0]);
        break;
      case "ru":
        setGroupedLangValue(langs[2]);
        break;
    }
  }

  setGroupedLangValue(String value) {
    langGroupValue = value;
    notifyListeners();
  }

  applyChoosedLang(BuildContext context) async {
    EasyLocalization.of(context)!.supportedLocales.forEach((element) async {
      if (_locale != null && element.languageCode == _locale!.languageCode) {
        await EasyLocalization.of(context)!.setLocale(element);
        Navigator.pop(context);
      }
    });
  }

  void changeLangByIndex(BuildContext context, int index) {
    setGroupedLangValue(langs[index]);

    switch (index) {
      case 0:
        //kz
        setLocale(context, Locale('kk'));
        break;

      case 1:
        setLocale(context, Locale('en'));
        //en
        break;

      case 2:
        //ru
        setLocale(context, Locale('ru'));
        break;
    }
  }

  setLocale(BuildContext context, Locale newLocale) {
    log("new locale is ${newLocale.languageCode}");
    _locale = newLocale;
    notifyListeners();
  }
}
