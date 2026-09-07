import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_model.dart';
import '../providers/app_state.dart';
import 'checkout_success_screen.dart';
import 'checkout_error_screen.dart';
import 'reviews_screen.dart';
import 'achievements_screen.dart';
import 'catalog_screen.dart';

class GameDetailScreen extends StatelessWidget {
  final Game game;
  const GameDetailScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(game.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Ir al Catálogo',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const CatalogScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(Icons.sports_esports, size: 80, color: Colors.purpleAccent),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(game.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Text(game.price, style: const TextStyle(fontSize: 22, color: Colors.purpleAccent, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Chip(
            label: Text(game.category),
            backgroundColor: const Color(0xFF7C3AED).withValues(alpha: 0.2),
            labelStyle: const TextStyle(color: Colors.purpleAccent),
          ),
          const SizedBox(height: 12),
          Text(game.description, style: const TextStyle(color: Colors.grey, height: 1.5, fontSize: 14)),
          const SizedBox(height: 20),
          const Text('Comunidad y Progreso', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF181A20),
                    foregroundColor: Colors.amber,
                    side: const BorderSide(color: Colors.white24),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ReviewsScreen()));
                  },
                  icon: const Icon(Icons.star, color: Colors.amber),
                  label: const Text('Ver Reseñas', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF181A20),
                    foregroundColor: Colors.purpleAccent,
                    side: const BorderSide(color: Colors.white24),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const AchievementsScreen()));
                  },
                  icon: const Icon(Icons.emoji_events, color: Colors.purpleAccent),
                  label: const Text('Ver Logros', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7C3AED),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                appState.addToCart(game);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const CheckoutSuccessScreen()),
                );
              },
              child: const Text('Comprar ahora', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF7C3AED)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                appState.addToCart(game);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${game.title} añadido al carrito')),
                );
              },
              child: const Text('Agregar al carrito', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutErrorScreen()));
            },
            child: const Text('Simular error de pago', style: TextStyle(color: Colors.redAccent, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}