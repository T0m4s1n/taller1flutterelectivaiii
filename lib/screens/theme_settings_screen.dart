import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aplicacionpruebaproyectos/providers/theme_provider.dart';

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDarkMode = themeProvider.isDarkMode;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Configuración de Tema'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Theme toggle section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.1)
                          : Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cambiar Tema',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.deepPurple,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: isDarkMode,
                          onChanged: (value) => themeProvider.toggleTheme(),
                          activeColor: Colors.yellow,
                          activeTrackColor: Colors.yellow.withOpacity(0.3),
                          inactiveThumbColor: Colors.deepPurple,
                          inactiveTrackColor: Colors.deepPurple.withOpacity(
                            0.3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Theme preview cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildThemePreviewCard(
                          'Modo Claro',
                          Icons.light_mode,
                          Colors.deepPurple,
                          Colors.white,
                          !isDarkMode,
                          () => themeProvider.toggleTheme(),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: _buildThemePreviewCard(
                          'Modo Oscuro',
                          Icons.dark_mode,
                          Colors.yellow,
                          Colors.grey[900]!,
                          isDarkMode,
                          () => themeProvider.toggleTheme(),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildThemePreviewCard(
    String title,
    IconData icon,
    Color iconColor,
    Color backgroundColor,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? iconColor : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(icon, size: 30, color: iconColor),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: backgroundColor == Colors.white
                    ? Colors.deepPurple
                    : Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            if (isSelected) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Activo',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: iconColor,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
