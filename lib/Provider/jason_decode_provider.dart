import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../Modals/all_units_modal.dart';
import '../Modals/json_decode_modal.dart';
import '../Modals/unit_modals.dart';

class ChapterJsonDecodeProvider extends ChangeNotifier {
  UnitJsonDecodeModel unitJsonDecodeModel = UnitJsonDecodeModel(
    data: '',
    decodedList: [],
    allUnit: [],
  );

  Future<void> loadJSON() async {
    unitJsonDecodeModel.data =
        await rootBundle.loadString('lib/Utils/all_units.json');

    unitJsonDecodeModel.decodedList = jsonDecode(unitJsonDecodeModel.data);

    unitJsonDecodeModel.allUnit = unitJsonDecodeModel.decodedList
        .map(
          (e) => AllUnitModel.fromMap(
            data: e,
          ),
        )
        .toList();
    notifyListeners();
  }
}

class ShlokJsonDecodeProvider extends ChangeNotifier {
  ShlokJsonDecodeModel shlokJsonDecodeModel = ShlokJsonDecodeModel(
    data: '',
    decodedList: [],
    allShloks: [],
  );

  Future<void> loadJSON(List list) async {
    shlokJsonDecodeModel.data =
        await rootBundle.loadString(list[unitIndex].jsonPath);

    shlokJsonDecodeModel.decodedList = jsonDecode(shlokJsonDecodeModel.data);

    shlokJsonDecodeModel.allShloks = shlokJsonDecodeModel.decodedList
        .map(
          (e) => ChapterModel.fromMap(
            data: e,
          ),
        )
        .toList();
    notifyListeners();
  }

  englishLanguage() {
    shlokJsonDecodeModel.allShloks[shlokIndex].translation =
        shlokJsonDecodeModel.allShloks[shlokIndex].english;
    notifyListeners();
  }

  hindiLanguage() {
    shlokJsonDecodeModel.allShloks[shlokIndex].translation =
        shlokJsonDecodeModel.allShloks[shlokIndex].hindi;
    notifyListeners();
  }

  gujaratiLanguage() {
    shlokJsonDecodeModel.allShloks[shlokIndex].translation =
        shlokJsonDecodeModel.allShloks[shlokIndex].gujarati;
    notifyListeners();
  }
}
