import 'package:flutter/material.dart';
import 'package:state_management/provider/count_provider.dart';
import 'package:state_management/provider/example_one_provider.dart';
import 'package:state_management/screens/example_one.dart';
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
      ],
      child :MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ExampleOneScreen(),
      ),
    );
  }
}

