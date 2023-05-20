import 'package:bunnymark_fl/bunnymark_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bunnymark Benchmark',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LayoutBuilder(builder: (context, constraints) {
        return BunnyMarkPage(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
        );
      }),
    );
  }
}
