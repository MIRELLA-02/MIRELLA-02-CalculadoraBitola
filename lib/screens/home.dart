import 'package:flutter/material.dart';
import 'produtos.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/calculadora.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 300),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 227, 49, 156),
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Produtos()),
              ),
              child: Text("Entrar"),
            ),
          ),
        ),
      ),
    );
  }
}
