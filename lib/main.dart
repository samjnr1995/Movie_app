import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/theme/custom_theme.dart';
import 'features/movieFlow/movieflow.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final dioProvider = Provider<Dio>((ref) => Dio(BaseOptions(
      baseUrl: 'http://api.themoviedb.org/3/',
    )));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: CustomTheme.darkTheme(context),
      themeMode: ThemeMode.dark,
      home: const MovieFlow(),
    );
  }
}
