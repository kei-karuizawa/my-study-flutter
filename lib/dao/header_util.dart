import 'package:my_study_flutter/dao/login_dao.dart';

hiHeaders() {
  Map<String, String> headers = {
    'auth-token': 'ZmEtMjAyMS0wNC0xMaiAyMToyddMjoyMC1mYQ==ft',
    'course-flag': 'ft',
    'boarding-pass': LoginDao.saveBoardingPass,
  };
  return headers;
}