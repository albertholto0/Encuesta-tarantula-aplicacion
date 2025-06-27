// home_screen.dart
import 'package:flutter/material.dart';
import 'package:cuestionario_tarantula/screens/form_body.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cuestionario_tarantula/services/api_service.dart';
import 'package:cuestionario_tarantula/widgets/buildCredit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Obtén la URL de visualización desde ApiService
  final String _visualizationUrl = ApiService.getVisualizationUrl();

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(_visualizationUrl))) {
      throw Exception('No se pudo lanzar $_visualizationUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final logoImage = brightness == Brightness.dark
        ? 'assets/images/logo_tarantula_dark.png'
        : 'assets/images/logo_tarantula_light.png';

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset(
                logoImage,
                width: 200,
                height: 120,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 16),
              Card(
                color: Theme.of(context).colorScheme.secondaryContainer,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Encuesta para la conservación',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Tarántula mexicana    (Tliltocatl schroederi)',
                        style: GoogleFonts.ptSerif(
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Ayúdanos a conocer más sobre esta especie y su conservación',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 24),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/tliltocatl_schroederi.jpeg',
                          width: 280,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 32),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormBodyScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.play_arrow),
                        label: Text(
                          'Iniciar cuestionario',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: Container(
                          child: Text(
                            "CRÉDITOS",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/logo_unsij_verde.png',
                                width: 120,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 20),
                              buildCreditItem(
                                context,
                                "Diseño Visual, Interfaz de Usuario",
                                "Diana Belen Luna Hernandez",
                                Icons.design_services,
                              ),
                              SizedBox(height: 15),
                              buildCreditItem(
                                context,
                                "Diseño, Lógica, Base de datos y Servidor web",
                                "Albert Alexis Contreras Mendoza",
                                Icons.developer_mode,
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '¡Gracias por usar nuestra aplicación!',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                            ),
                            child: Text(
                              "CERRAR",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  "Ver créditos",
                  style: TextStyle(
                    fontSize: 10,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: _launchUrl,
                icon: Icon(Icons.admin_panel_settings),
                label: Text('Administrador', style: TextStyle(fontSize: 10)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
