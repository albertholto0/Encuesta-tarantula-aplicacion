import 'package:flutter/material.dart';
import 'package:cuestionario_tarantula/domain/form.dart';
import 'package:cuestionario_tarantula/screens/quizz_body.dart';

class FormBodyScreen extends StatefulWidget {
  const FormBodyScreen({super.key});

  @override
  State<FormBodyScreen> createState() => _FormBodyScreenState();
}

class _FormBodyScreenState extends State<FormBodyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formulario = Formulario(
    nombre: '',
    edad: 0,
    sexo: '',
    lenguaMaterna: '',
    grupoEtnico: '',
    fuenteTrabajo: '',
    escolaridad: '',
    tenenciaTierra: '',
    estadoCivil: '',
    lugarOrigen: '',
  );

  final _nombreController = TextEditingController();
  final _edadController = TextEditingController();
  final _lenguaController = TextEditingController();
  final _grupoEtnicoController = TextEditingController();
  final _trabajoController = TextEditingController();
  final List<String> _escolaridades = [
    'Sin escolaridades',
    'Primaria',
    'Secundaria',
    'Preparatoria/Bachillerato',
    'Universidad',
    'Posgrado',
    'Doctorado',
    'Postdoctorado',
  ];
  final List<String> _estadosCiviles = ['Soltero(a)', 'Casado(a)', 'Viudo(a)'];
  final _origenController = TextEditingController();
  final _hijosController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _edadController.dispose();
    _lenguaController.dispose();
    _grupoEtnicoController.dispose();
    _trabajoController.dispose();
    _origenController.dispose();
    _hijosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Datos Personales')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              "Por favor rellena el siguiente formulario con tus datos",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Center(
              child: Card(
                color: Theme.of(context).colorScheme.secondaryContainer,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _nombreController,
                          decoration: InputDecoration(
                            labelText: 'Nombre completo',
                            labelStyle: TextStyle(fontSize: 14),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su nombre';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _edadController,
                          decoration: InputDecoration(
                            labelText: 'Edad',
                            labelStyle: TextStyle(fontSize: 14),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su edad';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Ingrese un número válido';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Sexo', style: TextStyle(fontSize: 14)),
                        Row(
                          children: [
                            Radio<String>(
                              value: 'M',
                              groupValue: _formulario.sexo,
                              onChanged: (value) {
                                setState(() {
                                  _formulario.sexo = value!;
                                });
                              },
                            ),
                            Text('Masculino', style: TextStyle(fontSize: 14)),
                            Radio<String>(
                              value: 'F',
                              groupValue: _formulario.sexo,
                              onChanged: (value) {
                                setState(() {
                                  _formulario.sexo = value!;
                                });
                              },
                            ),
                            Text('Femenino', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Tenencia de la tierra',
                          style: TextStyle(fontSize: 14),
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: 'comunal',
                              groupValue: _formulario.tenenciaTierra,
                              onChanged: (value) {
                                setState(() {
                                  _formulario.tenenciaTierra = value!;
                                });
                              },
                            ),
                            Text('Comunal', style: TextStyle(fontSize: 14)),
                            Radio<String>(
                              value: 'privada',
                              groupValue: _formulario.tenenciaTierra,
                              onChanged: (value) {
                                setState(() {
                                  _formulario.tenenciaTierra = value!;
                                });
                              },
                            ),
                            Text('Privada', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        TextFormField(
                          controller: _lenguaController,
                          decoration: InputDecoration(
                            labelText: 'Lengua materna',
                            labelStyle: TextStyle(fontSize: 14),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su lengua materna';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _grupoEtnicoController,
                          decoration: InputDecoration(
                            labelText: 'Grupo étnico',
                            labelStyle: TextStyle(fontSize: 14),
                          ),
                        ),
                        TextFormField(
                          controller: _trabajoController,
                          decoration: InputDecoration(
                            labelText: 'Principal fuente de trabajo',
                            labelStyle: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          value: _formulario.escolaridad.isNotEmpty
                              ? _formulario.escolaridad
                              : null,
                          decoration: InputDecoration(
                            labelText: 'Escolaridad',
                            labelStyle: TextStyle(fontSize: 11),
                          ),
                          items: _escolaridades
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _formulario.escolaridad = value ?? '';
                            });
                          },
                          validator: (value) => value == null || value.isEmpty
                              ? 'Seleccione una escolaridad'
                              : null,
                        ),
                        DropdownButtonFormField<String>(
                          value: _formulario.estadoCivil.isNotEmpty
                              ? _formulario.estadoCivil
                              : null,
                          decoration: InputDecoration(
                            labelText: 'Estado civil',
                            labelStyle: TextStyle(fontSize: 11),
                          ),
                          items: _estadosCiviles
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _formulario.estadoCivil = value ?? '';
                            });
                          },
                          validator: (value) => value == null || value.isEmpty
                              ? 'Seleccione un estado civil'
                              : null,
                        ),
                        TextFormField(
                          controller: _origenController,
                          decoration: InputDecoration(
                            labelText: 'Lugar de origen',
                            labelStyle: TextStyle(fontSize: 14),
                          ),
                        ),
                        TextFormField(
                          controller: _hijosController,
                          decoration: InputDecoration(
                            labelText: 'Número de hijos (opcional)',
                            labelStyle: TextStyle(fontSize: 14),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 32),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formulario.nombre = _nombreController.text;
                                _formulario.edad = int.parse(
                                  _edadController.text,
                                );
                                _formulario.lenguaMaterna =
                                    _lenguaController.text;
                                _formulario.grupoEtnico =
                                    _grupoEtnicoController.text.isEmpty
                                    ? 'Ninguno'
                                    : _grupoEtnicoController.text;
                                _formulario.fuenteTrabajo =
                                    _trabajoController.text;
                                _formulario.lugarOrigen =
                                    _origenController.text;
                                _formulario.numeroHijos =
                                    _hijosController.text.isEmpty
                                    ? null
                                    : int.parse(_hijosController.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizzBodyScreen(
                                      formulario: _formulario,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text('Continuar al cuestionario'),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
