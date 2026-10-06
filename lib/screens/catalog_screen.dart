import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import 'game_detail_screen.dart';
import 'cart_screen.dart';
import 'my_purchases_screen.dart';
import 'achievements_screen.dart';
import 'login_admin_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final categories = ['Todos', 'Acción', 'RPG', 'Deportes', 'Estrategia'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GAMEVAULT', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2, fontSize: 18)),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
                },
              ),
              if (appState.cart.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: Colors.purpleAccent, shape: BoxShape.circle),
                    child: Text(
                      '${appState.cart.length}',
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF14151B),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF181A20)),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color(0xFF7C3AED),
                child: Icon(Icons.person, size: 35, color: Colors.white),
              ),
              accountName: Text('Invitado / Usuario', style: TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: Text('usuario@correo.com', style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              leading: const Icon(Icons.login, color: Colors.purpleAccent),
              title: const Text('Iniciar Sesión'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add, color: Colors.purpleAccent),
              title: const Text('Registrarse'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen()));
              },
            ),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.store, color: Colors.purpleAccent),
              title: const Text('Catálogo Principal'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined, color: Colors.purpleAccent),
              title: const Text('Mis Compras'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const MyPurchasesScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.emoji_events_outlined, color: Colors.purpleAccent),
              title: const Text('Logros y Progreso'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AchievementsScreen()));
              },
            ),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.admin_panel_settings, color: Colors.orangeAccent),
              title: const Text('Área Administrativa'),
              subtitle: const Text('Panel de gestión y ventas', style: TextStyle(fontSize: 11, color: Colors.grey)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginAdminScreen()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                final isSelected = appState.selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: isSelected,
                    selectedColor: const Color(0xFF7C3AED),
                    backgroundColor: const Color(0xFF181A20),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    onSelected: (_) => appState.selectCategory(cat),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: appState.filteredGames.isEmpty
                  ? const Center(child: Text('No hay juegos en esta categoría', style: TextStyle(color: Colors.grey)))
                  : GridView.builder(
                      itemCount: appState.filteredGames.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // Adaptado a escritorio para mostrar más columnas en web
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        final game = appState.filteredGames[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => GameDetailScreen(game: game)),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF181A20),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                                    child: Image.network(
                                      game.imageUrl,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder: (context, error, stackTrace) => const Center(
                                        child: Icon(Icons.sports_esports, size: 40, color: Colors.purpleAccent),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        game.title,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(game.category, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            game.price,
                                            style: const TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.bold, fontSize: 13),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              appState.addToCart(game);
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text('${game.title} agregado al carrito'),
                                                  duration: const Duration(milliseconds: 800),
                                                  backgroundColor: const Color(0xFF7C3AED),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF7C3AED).withValues(alpha: 0.3),
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: const Icon(Icons.add_shopping_cart, size: 16, color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}