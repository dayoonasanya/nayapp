import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';

class NayaShieldScreen extends StatefulWidget {
  const NayaShieldScreen({super.key});

  @override
  State<NayaShieldScreen> createState() => _NayaShieldScreenState();
}

class _NayaShieldScreenState extends State<NayaShieldScreen> {
  final List<Map<String, String>> trustedContacts = [
    {'name': 'Adedayo', 'initial': 'O'},
    {'name': 'Emeka', 'initial': 'C'},
    {'name': 'Abubakar', 'initial': 'T'},
  ];

  final List<Map<String, String>> safetyAlerts = [
    {
      'type': 'Robbery',
      'icon': '🕵️',
      'timestamp': '3 mins ago',
      'message': 'Reported robbery at Ikeja Market'
    },
    {
      'type': 'Protest',
      'icon': '📢',
      'timestamp': '20 mins ago',
      'message': 'Protest ongoing at Lekki Toll Gate'
    },
    {
      'type': 'Fire',
      'icon': '🔥',
      'timestamp': '30 mins ago',
      'message': 'Fire outbreak reported in Yaba'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('NayaShield'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Risk Level
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Risk Level: HIGH',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  Icon(Icons.warning_amber_rounded, color: Colors.red),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // SOS Button
            GestureDetector(
              onLongPress: () {
                // Trigger SOS
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'HOLD\nSOS',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Trusted Contacts Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Trusted Contacts',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    // Add contact logic here
                  },
                  child: const Text('Add Contact'),
                ),
              ],
            ),

            // Trusted Contacts Avatars
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: trustedContacts.map((contact) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey.shade400,
                          child: Text(
                            contact['initial']!,
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          contact['name']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Live Safety Alerts',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Real-Time Alert Feed
            Expanded(
              child: ListView.builder(
                itemCount: safetyAlerts.length,
                itemBuilder: (context, index) {
                  final alert = safetyAlerts[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    elevation: 2,
                    child: ListTile(
                      leading: Text(
                        alert['icon']!,
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text(
                        alert['type']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(alert['message']!),
                      trailing: Text(
                        alert['timestamp']!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

