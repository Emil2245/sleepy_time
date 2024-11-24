import 'package:flutter/material.dart';
import 'package:sleepy_time/theme.dart';
import 'view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final materialTheme = MaterialTheme(ThemeData.light().textTheme);
    return MaterialApp(
      title: 'Sleepy Time',
      theme: materialTheme.light().copyWith(
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onPrimary, size: 34))),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      home: const HomeView(title: 'Sleepy Time'),
    );
  }
}
