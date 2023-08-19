import 'package:flutter/material.dart';
import 'package:state_management/provider/count_provider.dart';
import 'package:state_management/provider/example_one_provider.dart';
import 'package:state_management/provider/favourite_provider.dart';
import 'package:state_management/provider/theme_changer_provider.dart';
import 'package:state_management/screens/dark_theme.dart';
import 'package:state_management/screens/example_one.dart';
import 'package:state_management/screens/favourit/favourite_screen.dart';
import 'package:state_management/screens/notifyListnerScreen.dart';
import 'screens/count_example.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:  (_) => CountProvider(),),
        ChangeNotifierProvider(create:  (_) => ExampleOneProvider(),),
        ChangeNotifierProvider(create:  (_) => FavouriteItemProvider(),),
        ChangeNotifierProvider(create:  (_) => ThemeChangerProvider(),),
      ],
      child :Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: Provider.of<ThemeChangerProvider>(context).themeMode,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.teal,
              )
            ),
            home:  NotifyListnerScreen(),
          );
        },

      ),
    );
  }
}

