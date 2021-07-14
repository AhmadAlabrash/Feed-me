import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cachehelper {
  static SharedPreferences? shared;

  static Future initshared() async {
    return shared = await SharedPreferences.getInstance();
  }

  static Future putdata({@required word, @required val}) async {
    return await shared!.setBool(word, val);
  }

  static getdata({@required word}) {
    return shared!.get(word);
  }
}
