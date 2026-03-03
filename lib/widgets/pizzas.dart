import 'package:flutter/material.dart';

class PizzasPage extends StatelessWidget {
  const PizzasPage({super.key});

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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominos/refs/heads/main/Icono%20Dominos.png',
              height: 30,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.local_pizza, color: Colors.white),
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
            _buildPizzaBanner(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _rectanguloProducto(
                      "Pepperoni Especial",
                      "Extra pepperoni y queso mozzarella fundido.",
                      "\$199.00",
                      "https://raw.githubusercontent.com/Mirelesalexis/imagen-dominios2/refs/heads/main/Gemini_Generated_Image_nx38aunx38aunx38.png"), 
                  _rectanguloProducto(
                      "Mexicana",
                      "Chorizo, carne molida, jalapeño y cebolla.",
                      "\$215.00",
                      "https://raw.githubusercontent.com/Mirelesalexis/imagen-dominios2/refs/heads/main/Gemini_Generated_Image_ui042oui042oui04.png"),
                  _rectanguloProducto(
                      "Hawaiana",
                      "El clásico jamón con piña y extra queso.",
                      "\$189.00",
                      "https://raw.githubusercontent.com/Mirelesalexis/imagen-dominios2/refs/heads/main/Gemini_Generated_Image_otmxeaotmxeaotmx.png"),
                  _rectanguloProducto(
                      "Cuatro Quesos",
                      "Mezcla especial de quesos de la casa.",
                      "\$230.00",
                      "https://raw.githubusercontent.com/Mirelesalexis/imagen-dominios2/refs/heads/main/Gemini_Generated_Image_z2g72jz2g72jz2g7.png"),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _rectanguloProducto(String titulo, String info, String precio, String urlImagen) {
    return Container(
      width: double.infinity,
      height: 110,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
              child: Image.network(
                urlImagen,
                fit: BoxFit.cover,
                // Indicador de carga mientras baja la imagen
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator(color: azulCeruleo, strokeWidth: 2));
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.local_pizza, color: Colors.grey),
                ),
              ),
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: azulCeruleo.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: azulCeruleo.withOpacity(0.3)),
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

  Widget _buildPizzaBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: NetworkImage(
              'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominios2/refs/heads/main/Gemini_Generated_Image_det7ldet7ldet7ld.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
          ),
        ),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.bottomLeft,
        child: const Text("NUESTRAS PIZZAS",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}