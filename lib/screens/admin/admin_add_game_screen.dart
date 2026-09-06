import 'package:flutter/material.dart';

class AdminAddGameScreen extends StatefulWidget {
  const AdminAddGameScreen({super.key});

  @override
  State<AdminAddGameScreen> createState() => _AdminAddGameScreenState();
}

class _AdminAddGameScreenState extends State<AdminAddGameScreen> {
  bool _isCreated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestión de Videojuegos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isCreated ? _buildSuccessView(context) : _buildFormView(),
      ),
    );
  }

  Widget _buildFormView() {
    return ListView(
      children: [
        const Text('Agregar videojuego', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        const TextField(decoration: InputDecoration(labelText: 'Título del juego', border: OutlineInputBorder())),
        const SizedBox(height: 12),
        const TextField(decoration: InputDecoration(labelText: 'Género', border: OutlineInputBorder())),
        const SizedBox(height: 12),
        const TextField(decoration: InputDecoration(labelText: 'Precio (\$)', border: OutlineInputBorder())),
        const SizedBox(height: 12),
        const TextField(decoration: InputDecoration(labelText: 'Stock disponible', border: OutlineInputBorder())),
        const SizedBox(height: 12),
        const TextField(maxLines: 3, decoration: InputDecoration(labelText: 'Descripción', border: OutlineInputBorder())),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7C3AED), minimumSize: const Size(double.infinity, 50)),
          onPressed: () => setState(() => _isCreated = true),
          child: const Text('Guardar videojuego', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildSuccessView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 90),
          const SizedBox(height: 16),
          const Text('¡Videojuego agregado correctamente!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7C3AED)),
            onPressed: () => Navigator.pop(context),
            child: const Text('Ver catálogo admin', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}