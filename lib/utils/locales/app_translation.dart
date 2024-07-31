import 'package:get/get.dart';

import 'ar_eg.dart';
import 'en_us.dart';


class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'ar_EG': arEG, 'en_US': enUS};
}
