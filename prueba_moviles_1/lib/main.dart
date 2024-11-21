import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Promedio de Tres Números',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PromedioPage(),
    );
  }
}

class PromedioPage extends StatefulWidget {
  @override
  _PromedioPageState createState() => _PromedioPageState();
}

class _PromedioPageState extends State<PromedioPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _num3Controller = TextEditingController();
  double? _promedio;
  String? _errorMessage;

  void _calcularPromedio() {
    final num1 = int.tryParse(_num1Controller.text);
    final num2 = int.tryParse(_num2Controller.text);
    final num3 = int.tryParse(_num3Controller.text);

    setState(() {
      _errorMessage = null; 

     
      if (num1 == null || num1 < 0) {
        _errorMessage = 'Número 1 no válido';
      } else if (num2 == null || num2 < 0) {
        _errorMessage = 'Número 2 no válido';
      } else if (num3 == null || num3 < 0) {
        _errorMessage = 'Número 3 no válido';
      }

      if (_errorMessage == null) {
        _promedio = (num1! + num2! + num3!) / 3;
      } else {
        _promedio = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Calculadora Promedio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Número 1
            _buildTextField(_num1Controller, 'Número 1', Icons.looks_one),
            SizedBox(height: 10),
            // Número 2
            _buildTextField(_num2Controller, 'Número 2', Icons.looks_two),
            SizedBox(height: 10),
            // Número 3
            _buildTextField(_num3Controller, 'Número 3', Icons.looks_3),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularPromedio,
              child: Text('Calcular Promedio'),
            ),
            SizedBox(height: 20),
            // Mostrar resultado
            if (_promedio != null)
              Text(
                'El promedio es: ${_promedio!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            // Mostrar mensaje de error
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }

  // Método para crear el campo de texto con icono
  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
