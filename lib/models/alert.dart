class SafetyAlert {
  final String title;
  final String type; // e.g. robbery, protest
  final DateTime timestamp;

  SafetyAlert({
    required this.title,
    required this.type,
    required this.timestamp,
  });
}

