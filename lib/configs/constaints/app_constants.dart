import 'package:shared_preferences/shared_preferences.dart';

const appName = "MY CARE";

Future<String> loadCurrentLangage()async{
  String lang;
  final preferences= await SharedPreferences.getInstance();
 lang=preferences.getString('lang')!;
  if(lang=="") lang='fr';
  return lang;
}