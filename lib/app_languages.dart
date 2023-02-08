import 'package:b2geta_mobile/languages/de.dart';
import 'package:b2geta_mobile/languages/en.dart';
import 'package:b2geta_mobile/languages/tr.dart';
import 'package:get/get.dart';

class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': en, 'tr_TR': tr, 'de_DE': de};
}
