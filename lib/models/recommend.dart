import 'package:blibli_flutter/services/DioManager.dart';

class RecommendData {
  getRecList() {
    return DioManager().getList('x/feed/index?appkey=1d8b6e7d45233436&build=508000&login_event=0&mobi_app=android');
  }
}
