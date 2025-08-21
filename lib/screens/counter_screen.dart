import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aplicacionpruebaproyectos/providers/theme_provider.dart';
import 'package:aplicacionpruebaproyectos/models/counter_item.dart';
import 'dart:async';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  // Static variables for sharing data between screens
  static final List<CounterItem> _counterItems = <CounterItem>[];
  static int _nextId = 1;

  // Stream controller for real-time updates
  static final StreamController<List<CounterItem>> _streamController =
      StreamController<List<CounterItem>>.broadcast();

  // Static getter to access counter items
  static List<CounterItem> get counterItems =>
      List<CounterItem>.from(_counterItems);

  // Stream for real-time updates
  static Stream<List<CounterItem>> get counterItemsStream =>
      _streamController.stream;

  // Static method to add items
  static void addCounterItem(CounterItem item) {
    _counterItems.add(item);
    _streamController.add(List<CounterItem>.from(_counterItems));
  }

  // Static method to remove items
  static void removeCounterItem(int id) {
    _counterItems.removeWhere((item) => item.id == id);
    _streamController.add(List<CounterItem>.from(_counterItems));
  }

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      // Automatically add item to list when incrementing
      CounterItem newItem = CounterItem(
        id: CounterScreen._nextId++,
        value: _counter,
        timestamp: DateTime.now(),
      );
      CounterScreen.addCounterItem(newItem);
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        // Automatically remove the last item from list when decrementing
        if (CounterScreen._counterItems.isNotEmpty) {
          final lastItem = CounterScreen._counterItems.last;
          CounterScreen.removeCounterItem(lastItem.id);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDarkMode = themeProvider.isDarkMode;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Contador'),
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display counter
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.1)
                          : Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '$_counter',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const SizedBox(height: 30),

                  // Counter controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCounterButton(
                        icon: Icons.remove,
                        onPressed: _decrementCounter,
                        color: Colors.red,
                        isDarkMode: isDarkMode,
                      ),
                      const SizedBox(width: 20),
                      _buildCounterButton(
                        icon: Icons.add,
                        onPressed: _incrementCounter,
                        color: Colors.green,
                        isDarkMode: isDarkMode,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCounterButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
    required bool isDarkMode,
  }) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.white.withOpacity(0.1)
            : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 40, color: color),
        style: IconButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
