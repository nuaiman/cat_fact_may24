import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/facts/screens/cat_fact_screen.dart';

void main() {
  runApp(const ProviderScope(child: CatFactsApp()));
}

class CatFactsApp extends StatelessWidget {
  const CatFactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          scaffoldBackgroundColor: const Color(0xFFF9F9F9)),
      home: const CatFactScreen(),
    );
  }
}
