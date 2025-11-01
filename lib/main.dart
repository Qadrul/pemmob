import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes_1/config/routes.dart';
import 'package:tes_1/provider/app_state_provider.dart';
// ignore: unused_import
import 'package:tes_1/screens/signin_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppStateProvider(),
      child: MaterialApp.router(
        title: 'Anime Verse',
        theme: ThemeData(
          fontFamily: 'Urbanist',
        ),
        routerConfig: createRouter(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
