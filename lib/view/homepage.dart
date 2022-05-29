import 'package:elektronik_disposisi_management/provider/auth_provider.dart';
import 'package:elektronik_disposisi_management/widget/map_page.dart';
import 'package:elektronik_disposisi_management/widget/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/map_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapProvider = Provider.of<MapProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    mapProvider.initData();
    authProvider.getAllUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Elektronik Disposisi Management"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Row(children: [
              SizedBox(width: constraints.maxWidth / 1.5, child: const MapPage()),
              const Expanded(
                  child: Padding(
                padding: EdgeInsets.all(12.0),
                child: MenuPage(),
              ))
            ]),
          );
        },
      ),
    );
  }
}
