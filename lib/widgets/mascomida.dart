import 'package:flutter/material.dart';

class MasComidaPage extends StatelessWidget {
  const MasComidaPage({super.key});

  final Color azulCeruleo = const Color(0xFF007BA7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: azulCeruleo),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text("Bienvenido",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: azulCeruleo),
              title: const Text("Inicio"),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: azulCeruleo,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        // --- TÍTULO CON LOGO INTEGRADO ---
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominos/refs/heads/main/Icono%20Dominos.png',
              height: 30,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.fastfood, color: Colors.white),
            ),
            const SizedBox(width: 8),
            const Text(
              "DOMINO'S ALEXIS",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildFriesBanner(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _rectanguloProducto(
                      "Aros de Cebolla",
                      "Cebollas frescas empanizadas y doradas.",
                      "\$3.00",
                      'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominos/refs/heads/main/aros.jpg'),
                  _rectanguloProducto(
                      "Dedos de Queso",
                      "Mozzarella derretida con especias italianas.",
                      "\$5.00",
                      'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominos/refs/heads/main/ded.jpg'),
                  _rectanguloProducto(
                      "Papas fritas",
                      "Papas naturales con el toque de sal ideal.",
                      "\$3.00",
                      'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominos/refs/heads/main/pap.jpg'),
                  _rectanguloProducto(
                      "Nuggets de pollo",
                      "Pechuga de pollo crujiente (8 piezas).",
                      "\$3.00",
                      'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominos/refs/heads/main/ng.jpg'),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _rectanguloProducto(
      String titulo, String info, String precio, String? urlImagen) {
    return Container(
      width: double.infinity,
      height: 110,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5)),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: urlImagen != null
                  ? Image.network(
                      urlImagen,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.fastfood, color: Colors.grey),
                      ),
                    )
                  : Container(color: Colors.grey.shade200),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titulo,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(info,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      maxLines: 2),
                ],
              ),
            ),
          ),
          // --- PRECIO ESTILIZADO EN RECTÁNGULO ---
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: azulCeruleo.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: azulCeruleo.withValues(alpha: 0.3)),
              ),
              child: Text(
                precio,
                style: TextStyle(
                    color: azulCeruleo,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriesBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: NetworkImage(
              'https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg?auto=compress&cs=tinysrgb&w=800'),
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
        child: const Text("COMPLEMENTOS",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}