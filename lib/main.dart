import 'package:flutter/material.dart';
import 'package:movie/theme/custom_theme.dart';
import 'features/movieFlow/movieflow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      darkTheme: CustomTheme.darkTheme(context), // Remove the `?` after ThemeData
      themeMode: ThemeMode.dark,
      home: MovieFlow(),
    );
  }
}
