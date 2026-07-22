import 'package:flutter/material.dart';
import 'router.dart';

class UstadAIKidsApp extends StatelessWidget {
  const UstadAIKidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}