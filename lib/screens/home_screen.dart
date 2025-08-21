import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aplicacionpruebaproyectos/providers/theme_provider.dart';
import 'package:aplicacionpruebaproyectos/screens/layout_screen.dart';
import 'package:aplicacionpruebaproyectos/screens/counter_screen.dart';
import 'package:aplicacionpruebaproyectos/screens/list_screen.dart';
import 'package:aplicacionpruebaproyectos/screens/theme_settings_screen.dart';
import 'package:aplicacionpruebaproyectos/widgets/navigation_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDarkMode = themeProvider.isDarkMode;

        return Scaffold(
          appBar: AppBar(title: const Text('Tomasin App')),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDarkMode
                    ? [
                        const Color(0xFF1a1a2e),
                        const Color(0xFF16213e),
                        const Color(0xFF0f3460),
                      ]
                    : [
                        const Color(0xFFf3e5f5),
                        const Color(0xFFe1bee7),
                        const Color(0xFFce93d8),
                      ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavigationButton(
                    text: 'Layout con 3 Containers',
                    icon: Icons.grid_view,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LayoutScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  NavigationButton(
                    text: 'Contador',
                    icon: Icons.add_circle,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CounterScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  NavigationButton(
                    text: 'Lista de Contadores',
                    icon: Icons.list,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  NavigationButton(
                    text: 'Configuración de Tema',
                    icon: Icons.palette,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThemeSettingsScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
