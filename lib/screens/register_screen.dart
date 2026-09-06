import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _success = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GAMEVAULT - Registro')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _success ? _buildSuccessView(context) : _buildFormView(),
      ),
    );
  }

  Widget _buildFormView() {
    return ListView(
      children: [
        const Text('Crear cuenta', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const TextField(decoration: InputDecoration(labelText: 'Nombre y apellido', border: OutlineInputBorder())),
        const SizedBox(height: 14),
        const TextField(decoration: InputDecoration(labelText: 'Correo electrónico', border: OutlineInputBorder())),
        const SizedBox(height: 14),
        const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Contraseña', border: OutlineInputBorder())),
        const SizedBox(height: 24),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7C3AED), minimumSize: const Size(double.infinity, 50)),
          onPressed: () => setState(() => _success = true),
          child: const Text('Registrarse', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildSuccessView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 80),
          const SizedBox(height: 16),
          const Text('¡Cuenta creada correctamente!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Ya puedes iniciar sesión y disfrutar de GameVault.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7C3AED)),
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
            child: const Text('Ir a Iniciar sesión', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}