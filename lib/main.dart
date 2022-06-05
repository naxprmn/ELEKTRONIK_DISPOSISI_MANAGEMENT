import 'package:elektronik_disposisi_management/view/homepage.dart';
import 'package:elektronik_disposisi_management/view/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.greenAccent),
      home: const HomePage(),
    );
  }
}
