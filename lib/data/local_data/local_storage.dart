import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final myMagic = GetIt.instance;


initgetit ()async{
final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

myMagic.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

}