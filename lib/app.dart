import 'package:flutter/material.dart';
import 'presentation/pages/home.dart';
import 'presentation/pages/platform_detail/platform_detail_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contest Hunt',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: PlatformDetailPage(),
    );
  }
}
