import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class UtilsTool {
  final appserct = '1d8b6e7d45233436';
  // 获取加密后 播放地址
  String generateMd5(String data) {
    var time = DateTime.now().millisecondsSinceEpoch;
    String uri = 'appkey=1d8b6e7d45233436&build=5480400&ts=$time&aid=$data';
    var content = new Utf8Encoder().convert(uri + appserct);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return 'https://app.bilibili.com/x/v2/view?$uri&sign=' + Uri.encodeComponent(hex.encode(digest.bytes));
  }
}
