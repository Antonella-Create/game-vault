import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reseñas de la Comunidad')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Row(
            children: [
              Text('4.8', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              SizedBox(width: 12),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star_half, color: Colors.amber),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7C3AED)),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xFF181A20),
                  title: const Text('Escribir Reseña'),
                  content: const TextField(
                    maxLines: 3,
                    decoration: InputDecoration(hintText: '¿Qué te pareció el juego?', border: OutlineInputBorder()),
                  ),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar', style: TextStyle(color: Colors.grey))),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7C3AED)),
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Reseña publicada con éxito!')));
                      },
                      child: const Text('Publicar'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.rate_review, color: Colors.white),
            label: const Text('Escribir reseña', style: TextStyle(color: Colors.white)),
          ),
          const Divider(height: 30),
          const ListTile(
            leading: CircleAvatar(child: Text('JP')),
            title: Text('Juan Pérez'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [Icon(Icons.star, size: 14, color: Colors.amber), Icon(Icons.star, size: 14, color: Colors.amber)]),
                SizedBox(height: 4),
                Text('¡Increíble juego, el mundo es enorme y lleno de desafíos!'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}