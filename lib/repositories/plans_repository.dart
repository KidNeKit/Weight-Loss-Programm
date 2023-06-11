import 'package:shared_preferences/shared_preferences.dart';

class PlansRepository {
  final SharedPreferences _sharedPreferences;

  PlansRepository(SharedPreferences sharedPreferences)
      : _sharedPreferences = sharedPreferences;

  Future<void> initFirstSetup() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    if (!sharedPreferences.containsKey('isInit')) {
      sharedPreferences.setBool('isInit', true);
      await insertStartDate();
    }
  }

  Future<void> insertStartDate() async {
    await _sharedPreferences.setString('start_date', DateTime.now().toString());
  }

  int getCurrentDay() {
    DateTime dateTime = DateTime.now();
    DateTime startDate =
        DateTime.parse(_sharedPreferences.getString('start_date')!);
    int diff = dateTime.difference(startDate).inDays + 1;
    return diff > 30 ? 30 : diff;
  }
}
