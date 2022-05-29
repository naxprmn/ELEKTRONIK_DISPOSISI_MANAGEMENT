import 'package:elektronik_disposisi_management/provider/auth_provider.dart';
import 'package:elektronik_disposisi_management/provider/map_provider.dart';
import 'package:elektronik_disposisi_management/provider/view_provider.dart';
import 'package:elektronik_disposisi_management/view/homepage.dart';
import 'package:elektronik_disposisi_management/view/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ViewProvider>(
      create: (context) => ViewProvider(),
    ),
    ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
    ),
    ChangeNotifierProvider<MapProvider>(
      create: (context) => MapProvider(),
    ),
  ], child: const MyApp()));
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
