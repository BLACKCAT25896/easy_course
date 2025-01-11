
import 'package:easy_course/localization/language_model.dart';
import 'package:easy_course/util/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages() {
    return AppConstants.languages;
  }
}
