import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cuestionario_tarantula/domain/form.dart';
import 'package:cuestionario_tarantula/services/api_service.dart';
import 'package:cuestionario_tarantula/screens/home_screen.dart';

class FinalScreen extends StatefulWidget {
  final Formulario formulario;
  final List<String> respuestas;

  const FinalScreen({
    super.key,
    required this.formulario,
    required this.respuestas,
  });

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  final TextEditingController _controller = TextEditingController();
  String _submittedOpinion = '';
  bool _isLoading = false;

  Future<void> _enviarDatos() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final datosCompletos = {
        ...widget.formulario.toJson(),
        'opinion': _controller.text,
        'respuestas': widget.respuestas,
      };

      // Debug: Imprimir los datos que se enviarán
      print('Datos a enviar: ${jsonEncode(datosCompletos)}');

      final success = await ApiService.guardarEncuesta(datosCompletos);

      if (!success) {
        throw Exception('Error al guardar los datos');
      }

      setState(() {
        _submittedOpinion = _controller.text;
        _isLoading = false;
      });

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('¡Gracias por participar!'),
          content: const Text('Sus respuestas han sido enviadas'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false,
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
      print('Error detallado: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escribe tu opinión'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tu opinión',
                hintText: 'Escribe aquí tu opinión personal...',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _enviarDatos,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Enviar'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
