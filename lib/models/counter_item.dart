class CounterItem {
  final int id;
  final int value;
  final DateTime timestamp;

  CounterItem({required this.id, required this.value, required this.timestamp});

  @override
  String toString() {
    return 'CounterItem(id: $id, value: $value, timestamp: $timestamp)';
  }
}
