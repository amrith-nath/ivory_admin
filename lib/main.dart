import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ivory_admin/presentation/screen_add_product/screen_add_product.dart';
import 'package:ivory_admin/presentation/screen_home/screen_home.dart';
import 'package:ivory_admin/presentation/screen_product/screen_product.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
          )),
      home: const ScreenHome(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const ScreenHome(),
        ),
        GetPage(
          name: '/products',
          page: () => ScreenProduct(),
        ),
        GetPage(
          name: '/products/add',
          page: () => ScreenAddProduct(),
        ),
      ],
    );
  }
}
