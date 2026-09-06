import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import 'checkout_success_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Carrito de Compras')),
      body: appState.cart.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.remove_shopping_cart, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('Tu carrito está vacío', style: TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: appState.cart.length,
                      itemBuilder: (context, index) {
                        final game = appState.cart[index];
                        return Card(
                          color: const Color(0xFF181A20),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: const Icon(Icons.sports_esports, color: Colors.purpleAccent),
                            title: Text(game.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(game.price, style: const TextStyle(color: Colors.purpleAccent)),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                              onPressed: () => appState.removeFromCart(game),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(color: Colors.white24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total a pagar:', style: TextStyle(fontSize: 18, color: Colors.grey)),
                      Text('\$${appState.cartTotal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.purpleAccent)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7C3AED),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        appState.clearCart();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const CheckoutSuccessScreen()),
                        );
                      },
                      child: const Text('Confirmar compra', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}