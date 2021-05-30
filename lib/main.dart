import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  GestureBinding.instance?.resamplingEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Tajawal",
      ),
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      initialRoute: box.read("currentUser") == null ? AppPages.INITIAL_LOGIN : AppPages.INITIAL_HOME,
      getPages: AppPages.routes,
      title: 'Crypto Station',
    );
  }
}