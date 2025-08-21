import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aplicacionpruebaproyectos/providers/theme_provider.dart';
import 'package:aplicacionpruebaproyectos/models/counter_item.dart';
import 'package:aplicacionpruebaproyectos/screens/counter_screen.dart';
import 'dart:async'; // Added for StreamSubscription

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<CounterItem> _items = [];
  late StreamSubscription<List<CounterItem>> _subscription;

  @override
  void initState() {
    super.initState();
    _loadItems();
    // Subscribe to real-time updates
    _subscription = CounterScreen.counterItemsStream.listen((items) {
      setState(() {
        _items = items;
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _loadItems() {
    setState(() {
      try {
        _items = CounterScreen.counterItems;
      } catch (e) {
        _items = [];
      }
    });
  }

  void _refreshList() {
    setState(() {
      try {
        _items = CounterScreen.counterItems;
      } catch (e) {
        _items = [];
      }
    });
  }

  void _removeItem(int id) {
    CounterScreen.removeCounterItem(id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDarkMode = themeProvider.isDarkMode;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de Contadores'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: _refreshList,
              ),
            ],
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
            child: _items.isEmpty
                ? _buildEmptyState(isDarkMode)
                : _buildListView(isDarkMode),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.1)
                  : Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              Icons.list_alt,
              size: 60,
              color: isDarkMode ? Colors.white : Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.1)
                  : Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? Colors.yellow.withOpacity(0.2)
                      : Colors.deepPurple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    '${item.value}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.yellow : Colors.deepPurple,
                    ),
                  ),
                ),
              ),
              title: Text(
                'Contador #${item.id}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              subtitle: Text(
                'Valor: ${item.value} | ${_formatDateTime(item.timestamp)}',
                style: TextStyle(
                  color: isDarkMode
                      ? Colors.white.withOpacity(0.7)
                      : Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.yellow.withOpacity(0.1)
                          : Colors.deepPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'ID: ${item.id}',
                      style: TextStyle(
                        color: isDarkMode ? Colors.yellow : Colors.deepPurple,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () => _removeItem(item.id),
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
