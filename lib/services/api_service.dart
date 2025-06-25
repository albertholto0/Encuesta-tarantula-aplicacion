import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'http://10.0.2.2/api';

  static Future<bool> guardarEncuesta(Map<String, dynamic> datos) async {
    final url = Uri.parse('$_baseUrl/guardar_encuesta.php');
    print('Enviando a: $url'); // Debug

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(datos),
      );

      print('Respuesta del servidor: ${response.body}'); // Debug

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['success'] ?? false;
      }
      return false;
    } catch (e) {
      print('Error en la petición: $e'); // Debug
      return false;
    }
  }
}
