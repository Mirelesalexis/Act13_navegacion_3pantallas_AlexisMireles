import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  final Color azulCeruleo = const Color(0xFF007BA7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: azulCeruleo),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            
            // 1. TÍTULO EN GRANDE
            Text(
              "INICIAR SESIÓN",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: azulCeruleo,
                letterSpacing: -1,
              ),
            ),
            
            const SizedBox(height: 40),

            // 2. CAMPO DE CORREO
            TextField(
              decoration: InputDecoration(
                labelText: "Correo Electrónico",
                hintText: "ejemplo@correo.com",
                prefixIcon: Icon(Icons.email_outlined, color: azulCeruleo),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 3. CAMPO DE CONTRASEÑA
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña",
                prefixIcon: Icon(Icons.lock_outline, color: azulCeruleo),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // BOTÓN DE ENTRAR
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: azulCeruleo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "ENTRAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // 4. TEXTO "No tienes cuenta? Crear una"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("¿No tienes cuenta? "),
                GestureDetector(
                  onTap: () {
                    // Por el momento no hace nada
                  },
                  child: Text(
                    "Crear una",
                    style: TextStyle(
                      color: azulCeruleo,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),

            // 5. ICONO DE DOMINO'S Y TEXTOS INFERIORES
            Center(
              child: Column(
                children: [
                  Image.network(
                    'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominos/refs/heads/main/Icono%20Dominos.png',
                    height: 80,
                    errorBuilder: (context, error, stackTrace) => 
                        Icon(Icons.local_pizza, size: 70, color: azulCeruleo.withValues(alpha: 0.5)),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "La mejor cadena de pizzas",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Domino's",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: azulCeruleo,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}