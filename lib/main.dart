import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aplicacionpruebaproyectos/providers/theme_provider.dart';
import 'package:aplicacionpruebaproyectos/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'DemoTomasin',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentTheme,
          home: const HomeScreen(),
        );
      },
    );
  }
}
