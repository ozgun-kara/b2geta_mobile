import 'package:get/get.dart';

class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // LANGUAGE PAGE
          'Language Selection': 'Language Selection',
          'Save': 'Save',
        },
        'tr_TR': {
          // LANGUAGE PAGE
          'Language Selection': 'Dil Seçimi',
          'Save': 'Kaydet',
        },
        'de_DE': {
          // LANGUAGE PAGE
          'Language Selection': 'Sprachauswahl',
          'Save': 'Sparen',
        }
      };
}
