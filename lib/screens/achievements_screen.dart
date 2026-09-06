import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logros y Progreso')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Progreso general', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          LinearProgressIndicator(value: 0.65, backgroundColor: Colors.grey[800], color: Colors.purpleAccent),
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.emoji_events, color: Colors.amber, size: 36),
            title: Text('Cazador'),
            subtitle: Text('Derrota 100 enemigos (65 / 100)'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.emoji_events, color: Colors.grey, size: 36),
            title: Text('Primer paso'),
            subtitle: Text('Completa el tutorial'),
          ),
        ],
      ),
    );
  }
}