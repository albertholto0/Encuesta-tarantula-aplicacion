// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Ahora es pública (sin guion bajo)
  //static const String baseUrl = 'http://10.0.2.2/api';
  static const String baseUrl = 'http://192.168.137.215/api';

  // Método para obtener la URL de visualización
  static String getVisualizationUrl() {
    return '$baseUrl/visualizar_encuestas.php';
  }

  static Future<bool> guardarEncuesta(Map<String, dynamic> datos) async {
    final url = Uri.parse('$baseUrl/guardar_encuesta.php'); // Usa baseUrl
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
