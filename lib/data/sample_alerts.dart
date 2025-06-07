import '../models/alert.dart';

final List<SafetyAlert> sampleAlerts = [
  SafetyAlert(
    title: 'Robbery reported at Ibadan/Lagos Highway',
    type: 'robbery',
    timestamp: DateTime.now().subtract(Duration(minutes: 5)),
  ),
  SafetyAlert(
    title: 'Heavy traffic from Redemption Camp, Mowe to Ogere Toll Gate',
    type: 'traffic',
    timestamp: DateTime.now().subtract(Duration(minutes: 15)),
  ),
];

