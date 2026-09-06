import 'package:flutter/material.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestión de Usuarios')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Usuarios registrados', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Usuario')),
                  DataColumn(label: Text('Correo')),
                  DataColumn(label: Text('Rol')),
                  DataColumn(label: Text('Estado')),
                  DataColumn(label: Text('Acciones')),
                ],
                rows: [
                  _buildUserRow(context, 'Juan Pérez', 'juan@correo.com', 'Cliente', 'Activo'),
                  _buildUserRow(context, 'María García', 'maria@correo.com', 'Cliente', 'Activo'),
                  _buildUserRow(context, 'Admin Master', 'admin@gamevault.com', 'Administrador', 'Activo'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildUserRow(BuildContext context, String name, String email, String role, String status) {
    return DataRow(
      cells: [
        DataCell(Text(name)),
        DataCell(Text(email)),
        DataCell(Text(role)),
        DataCell(Text(status, style: TextStyle(color: status == 'Activo' ? Colors.green : Colors.red, fontWeight: FontWeight.bold))),
        DataCell(
          Row(
            children: [
              IconButton(icon: const Icon(Icons.edit, size: 18, color: Colors.blueAccent), onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Editando $name')));
              }),
              IconButton(icon: const Icon(Icons.delete, size: 18, color: Colors.redAccent), onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Usuario $name modificado')));
              }),
            ],
          ),
        ),
      ],
    );
  }
}