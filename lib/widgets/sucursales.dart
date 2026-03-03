import 'package:flutter/material.dart';

class SucursalesPage extends StatelessWidget {
  const SucursalesPage({super.key});

  final Color azulCeruleo = const Color(0xFF007BA7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: azulCeruleo,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "NUESTRAS SUCURSALES",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // --- BANNER DE SUCURSALES ---
            _buildSucursalBanner(),
            const SizedBox(height: 10),
            // --- LISTA DE TARJETAS ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _tarjetaSucursal("Sucursal Centro", "Av. Reforma #123, Col. Centro"),
                  _tarjetaSucursal("Sucursal Norte", "Blvd. Independencia #456, Plaza Norte"),
                  _tarjetaSucursal("Sucursal Poniente", "Calle 16 de Septiembre #789, Col. Obrera"),
                  _tarjetaSucursal("Sucursal Oriente", "Av. de las Torres #101, Plaza Oriente"),
                  _tarjetaSucursal("Sucursal Universidad", "Circuito Universitario #202, Zona Escolar"),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _tarjetaSucursal(String nombre, String direccion) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // Icono de dirección
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: azulCeruleo.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.location_on, color: azulCeruleo, size: 30),
          ),
          const SizedBox(width: 15),
          // Texto de la dirección
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  direccion,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
        ],
      ),
    );
  }

  Widget _buildSucursalBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: NetworkImage(
              'https://images.pexels.com/photos/1510610/pexels-photo-1510610.jpeg?auto=compress&cs=tinysrgb&w=800'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
          ),
        ),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.bottomLeft,
        child: const Text("ENCUÉNTRANOS",
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
      ),
    );
  }
}