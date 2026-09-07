import 'package:flutter/material.dart';
import '../models/game_model.dart';
import 'game_detail_screen.dart';

class MyPurchasesScreen extends StatelessWidget {
  const MyPurchasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Game> purchasedGames = [
      Game(
        id: '1',
        title: 'Elden Ring Nightreign',
        price: '\$69.99',
        category: 'RPG',
        description: 'Nueva entrega multijugador cooperativo ambientada en el universo de Elden Ring.',
        imageUrl: 'https://res.cloudinary.com/h3zsa1nd/image/upload/v1788750472/WhatsApp_Image_2026-09-06_at_1.08.02_PM.jpg',
      ),
      Game(
        id: '5',
        title: 'FC 24',
        price: '\$49.99',
        category: 'Deportes',
        description: 'El simulador de fútbol definitivo con todas las ligas y licencias oficiales.',
        imageUrl: 'https://res.cloudinary.com/h3zsa1nd/image/upload/v1788750472/WhatsApp_Image_2026-09-06_at_1.09.06_PM.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Mis compras')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: purchasedGames.length,
        itemBuilder: (context, index) {
          final game = purchasedGames[index];
          return Card(
            color: const Color(0xFF181A20),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  game.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[800],
                    child: const Icon(Icons.sports_esports, color: Colors.purpleAccent),
                  ),
                ),
              ),
              title: Text(game.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text('Precio: ${game.price}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ),
              trailing: OutlinedButton(
                style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0xFF7C3AED))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => GameDetailScreen(game: game)));
                },
                child: const Text('Ver detalle', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          );
        },
      ),
    );
  }
}