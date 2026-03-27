import 'package:flutter/material.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  double corrente = 0.0;
  double distancia = 0.0;

  double calcu110() {
    return (2 * corrente * distancia) / 294.64;
  }

  double calcu220() {
    return (2 * corrente * distancia) / 510.4;
  }

  void resultado() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 255, 110, 153),
        title: const Text("Resultado", style: TextStyle(color: Colors.white)),
        content: Text(
          "110V: ${calcu110().toStringAsFixed(2)} mm²\n"
          "220V: ${calcu220().toStringAsFixed(2)} mm²",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  InputDecoration campo(String texto) {
    return InputDecoration(
      hintText: texto,
      hintStyle: const TextStyle(color: Color.fromARGB(232, 0, 0, 0)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.white, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 110, 153),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Cálculo de Bitola",
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: campo("Digite a corrente em amperes"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                corrente = double.tryParse(value) ?? 0;
              },
            ),

            const SizedBox(height: 10),

            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: campo("Digite a distância"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                distancia = double.tryParse(value) ?? 0;
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: resultado,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 233, 74, 137),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("Calcular"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 226, 131, 185),
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("Saída de Tela"),
            ),
          ],
        ),
      ),
    );
  }
}
