import 'package:flutter/material.dart';
import 'widgets/bebidas.dart';
import 'widgets/mascomida.dart';
import 'widgets/pizzas.dart';
import 'widgets/sucursales.dart';
import 'widgets/login.dart';

void main() => runApp(const AppDominos());

class AppDominos extends StatelessWidget {
  const AppDominos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF007BA7),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PizzaFilaColumna(),
        '/pizzas': (context) => const PizzasPage(),
        '/bebidas': (context) => const BebidasPage(),
        '/mas_comida': (context) => const MasComidaPage(),
        '/sucursales': (context) => const SucursalesPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}

class PizzaFilaColumna extends StatelessWidget {
  const PizzaFilaColumna({super.key});

  final Color azulCeruleo = const Color(0xFF007BA7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: azulCeruleo),
              child: const Center(
                child: Text(
                  "DOMINO'S MENU",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: azulCeruleo),
              title: const Text("Inicio"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.login, color: azulCeruleo),
              title: const Text("Iniciar Sesión"),
              onTap: () => Navigator.pushNamed(context, '/login'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 4,
        backgroundColor: azulCeruleo,
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 90, // Hacemos la barra más grande
        centerTitle: true,
        // 1. TÍTULO CENTRADO CON ICONO A LA DERECHA
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "DOMINO'S ALEXIS",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 1,
                  fontSize: 20),
            ),
            const SizedBox(width: 8),
            Image.network(
              'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominos/refs/heads/main/Icono%20Dominos.png',
              height: 28,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.local_pizza, color: Colors.white),
            ),
          ],
        ),
        // 2. ICONO DE LUPA A LA DERECHA
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 28, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 5),
        ],
        // 3. BOTÓN DE INICIAR SESIÓN EN LA PARTE INFERIOR DE LA BARRA
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/login'),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "INICIAR SESIÓN",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPromoBanner(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(
                "Categorías",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          _botonMenu(context, "Pizzas", [Colors.orange, Colors.red.shade700],
                              Icons.local_pizza, '/pizzas'),
                          _botonMenu(context, "Bebidas", [Colors.cyan, Colors.blue.shade700],
                              Icons.local_drink, '/bebidas'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          _botonMenu(context, "Sucursales", [Colors.green, Colors.teal.shade700],
                              Icons.storefront, '/sucursales'),
                          _botonMenu(context, "Más Comida", [Colors.purple, Colors.deepPurple.shade700],
                              Icons.kebab_dining, '/mas_comida'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _botonMenu(BuildContext context, String titulo, List<Color> colores,
      IconData icono, String? ruta) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (ruta != null) Navigator.pushNamed(context, ruta);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colores,
            ),
            boxShadow: [
              BoxShadow(
                color: colores[1].withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: -15,
                bottom: -15,
                child: Icon(icono,
                    size: 80, color: Colors.white.withValues(alpha: 0.15)),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icono, size: 35, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      titulo,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=800&q=80'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withValues(alpha: 0.8), Colors.transparent],
          ),
        ),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.bottomLeft,
        child: const Text("PROMOS EXCLUSIVAS",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}