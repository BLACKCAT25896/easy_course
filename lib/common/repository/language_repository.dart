
import 'package:test_project/localization/language_model.dart';
import 'package:test_project/util/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages() {
    return AppConstants.languages;
  }
}
