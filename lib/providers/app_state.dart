import 'package:flutter/material.dart';
import '../models/game_model.dart';

class AppState extends ChangeNotifier {
  String _selectedCategory = 'Todos';
  final List<Game> _cart = [];

  final List<Game> _allGames = [
    Game(
      id: '1',
      title: 'Elden Ring Nightreign',
      price: '\$69.99',
      category: 'RPG',
      description: 'Nueva entrega multijugador cooperativo ambientada en el universo de Elden Ring.',
      imageUrl: 'https://res.cloudinary.com/h3zsa1nd/image/upload/v1788750472/WhatsApp_Image_2026-09-06_at_1.08.02_PM.jpg',
    ),
    Game(
      id: '2',
      title: 'Super Mario Advance',
      price: '\$19.99',
      category: 'Acción',
      description: 'Clásico de plataformas y aventura de Nintendo Game Boy Advance.',
      imageUrl: 'https://res.cloudinary.com/h3zsa1nd/image/upload/v1788750472/WhatsApp_Image_2026-09-06_at_1.08.03_PM.jpg',
    ),
    Game(
      id: '3',
      title: 'Pokémon Edición Azul',
      price: '\$24.99',
      category: 'RPG',
      description: 'El clásico RPG original de Game Boy para atraparlos a todos.',
      imageUrl: 'https://res.cloudinary.com/h3zsa1nd/image/upload/v1788750472/WhatsApp_Image_2026-09-06_at_1.08.04_PM_1.jpg',
    ),
    Game(
      id: '4',
      title: 'Dragon Warrior Monsters 2',
      price: '\$29.99',
      category: 'Estrategia',
      description: 'Aventura épica de rol y domesticación de monstruos para Game Boy Color.',
      imageUrl: 'https://res.cloudinary.com/h3zsa1nd/image/upload/v1788750472/WhatsApp_Image_2026-09-06_at_1.08.04_PM.jpg',
    ),
    Game(
      id: '5',
      title: 'FC 24',
      price: '\$49.99',
      category: 'Deportes',
      description: 'El simulador de fútbol definitivo con todas las ligas y licencias oficiales.',
      imageUrl: 'https://res.cloudinary.com/h3zsa1nd/image/upload/v1788750472/WhatsApp_Image_2026-09-06_at_1.09.06_PM.jpg',
    ),
    Game(
      id: '6',
      title: 'God of War Laufey',
      price: '\$59.99',
      category: 'Acción',
      description: 'Nueva aventura mitológica centrada en la historia de Laufey.',
      imageUrl: 'https://res.cloudinary.com/h3zsa1nd/image/upload/v1788750472/WhatsApp_Image_2026-09-06_at_1.09.19_PM.jpg',
    ),
  ];

  String get selectedCategory => _selectedCategory;
  List<Game> get cart => _cart;

  List<Game> get filteredGames {
    if (_selectedCategory == 'Todos') {
      return _allGames;
    }
    return _allGames.where((game) => game.category == _selectedCategory).toList();
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void addToCart(Game game) {
    if (!_cart.any((item) => item.id == game.id)) {
      _cart.add(game);
      notifyListeners();
    }
  }

  void removeFromCart(Game game) {
    _cart.removeWhere((item) => item.id == game.id);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  double get cartTotal {
    return _cart.fold(0.0, (sum, item) {
      final cleanPrice = double.tryParse(item.price.replaceAll('\$', '')) ?? 0.0;
      return sum + cleanPrice;
    });
  }
}