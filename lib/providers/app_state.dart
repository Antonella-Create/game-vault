import 'package:flutter/material.dart';
import '../models/game_model.dart';

class AppState extends ChangeNotifier {
  String _selectedCategory = 'Todos';
  final List<Game> _cart = [];

  final List<Game> _allGames = [
    Game(id: '1', title: 'Elden Ring', price: '\$59.99', category: 'RPG', description: 'RPG de acción en mundo abierto.'),
    Game(id: '2', title: 'Cyberpunk 2077', price: '\$29.99', category: 'RPG', description: 'Futurismo y acción en Night City.'),
    Game(id: '3', title: 'FC 24', price: '\$49.99', category: 'Deportes', description: 'El simulador de fútbol definitivo.'),
    Game(id: '4', title: 'NBA 2K24', price: '\$39.99', category: 'Deportes', description: 'Vive la emoción del baloncesto profesional.'),
    Game(id: '5', title: 'God of War', price: '\$39.99', category: 'Acción', description: 'Aventura mitológica épica de Kratos.'),
    Game(id: '6', title: 'Devil May Cry 5', price: '\$24.99', category: 'Acción', description: 'Acción vertiginosa y estilo hack and slash.'),
    Game(id: '7', title: 'Civilization VI', price: '\$19.99', category: 'Estrategia', description: 'Construye un imperio que resista el paso del tiempo.'),
    Game(id: '8', title: 'Age of Empires II', price: '\$14.99', category: 'Estrategia', description: 'Estrategia clásica en tiempo real remasterizada.'),
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