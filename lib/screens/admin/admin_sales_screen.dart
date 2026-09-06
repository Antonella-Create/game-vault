import 'package:flutter/material.dart';

class AdminSalesScreen extends StatelessWidget {
  const AdminSalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reporte de Ventas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Historial de Ventas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  Card(
                    color: Color(0xFF181A20),
                    child: ListTile(
                      title: Text('Elden Ring'),
                      subtitle: Text('Usuario: Juan Pérez\nFecha: 20/06/2026'),
                      isThreeLine: true,
                      trailing: Text('\$59.99', style: TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                  Card(
                    color: Color(0xFF181A20),
                    child: ListTile(
                      title: Text('FC 24'),
                      subtitle: Text('Usuario: María García\nFecha: 18/04/2026'),
                      isThreeLine: true,
                      trailing: Text('\$49.99', style: TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}