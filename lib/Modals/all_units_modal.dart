class AllUnitModel {
  int unitNo;
  int versesCount;
  int id;
  String unitSummaryEnglish;
  String unitSummaryHindi;
  String imageName;
  String nameHindi;
  String nameMeaning;
  String nameTranslationEnglish;
  String jsonPath;

  AllUnitModel({
    required this.unitNo,
    required this.versesCount,
    required this.id,
    required this.unitSummaryEnglish,
    required this.unitSummaryHindi,
    required this.imageName,
    required this.nameHindi,
    required this.nameMeaning,
    required this.nameTranslationEnglish,
    required this.jsonPath,
  });

  factory AllUnitModel.fromMap({required Map data}) {
    return AllUnitModel(
      unitNo: data['unit_number'],
      versesCount: data['verses_count'],
      id: data['id'],
      unitSummaryEnglish: data['unit_summary_english'],
      unitSummaryHindi: data['unit_summary_hindi'],
      imageName: data['image_name'],
      nameHindi: data['name'],
      nameMeaning: data['name_meaning'],
      nameTranslationEnglish: data['name_translation'],
      jsonPath: data['json_path'],
    );
  }
}
