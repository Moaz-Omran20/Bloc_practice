import 'package:bloc_practice/app_router.dart';
import 'package:bloc_practice/presentation_layer/screens/characters_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(),));
}


class MyApp extends StatelessWidget {
  MyApp({required this.appRouter});

  AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: {CharachtersScreen.routeName:(context) => CharachtersScreen(),},
      // initialRoute: CharachtersScreen.routeName,
      onGenerateRoute: appRouter.generateRoute,
    );
  }


}
