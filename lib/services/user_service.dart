import 'package:shared_preferences/shared_preferences.dart';

class UserService {

  static const String _userNameKey = 'user_name';

  //Save UserName to SharedPreferences
  Future<void> saveUserName(String name) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, name.trim());
  }

  //Load UserName form SharedPreferences
  Future <String?> loadUserName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }
}

