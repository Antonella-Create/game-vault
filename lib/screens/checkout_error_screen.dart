import 'package:flutter/material.dart';
import 'catalog_screen.dart';
import 'cart_screen.dart';

class CheckoutErrorScreen extends StatelessWidget {
  const CheckoutErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error de Pago')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cancel, color: Colors.redAccent, size: 90),
              const SizedBox(height: 20),
              const Text('No se pudo completar\nla compra', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, height: 1.2), textAlign: TextAlign.center),
              const SizedBox(height: 12),
              const Text('Ocurrió un problema al procesar tu pago.\nPor favor, intenta nuevamente.', style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.4), textAlign: TextAlign.center),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7C3AED), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CartScreen()));
                  },
                  child: const Text('Intentar nuevamente', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white24), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const CatalogScreen()), (route) => false);
                  },
                  child: const Text('Volver al catálogo', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}