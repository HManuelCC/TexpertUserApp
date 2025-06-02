import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supportapp/Bloc/RegistroBloc/RegistroBloc.dart';
import 'package:supportapp/Bloc/RegistroBloc/RegistroEvent.dart';
import 'package:supportapp/Bloc/RegistroBloc/RegistroState.dart';
import 'package:supportapp/Data/Models/User.dart';
import 'package:supportapp/Design/Loading/Cargando.dart';

class CreateAccountScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final TextEditingController _anyDeskController = TextEditingController();

  final UserData _usuario = UserData();

  CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistroBloc>(
      create: (context) => RegistroBloc(),
      child: BlocListener<RegistroBloc, RegistroState>(
        listener: (context, state) {
          if (state is RegistroFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.black,
              ),
            );
          }
          if (state is RegistroSuccess) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    const Text("Registro exitoso, ahora puedes iniciar sesión"),
                backgroundColor: Colors.black,
              ),
            );
          }
        },
        child: BlocBuilder<RegistroBloc, RegistroState>(
          builder: (context, state) {
            if (state is RegistroInitial || state is RegistroFailure) {
              return _registroDesign(context);
            }
            if (state is RegistroLoading) {
              return const Cargando();
            }
            if (state is RegistroSuccess) {
              return const Cargando();
            } else {
              throw Exception("Error en el registro");
            }
          },
        ),
      ),
    );
  }

  Widget _registroDesign(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registro',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.longestSide,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade900, Colors.blue.shade200],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Row(
                  children: [
                    Expanded(
                        child: _buildTextField(Icons.person, 'Nombre',
                            TextInputType.name, _nameController)),
                    const SizedBox(width: 10),
                    Expanded(
                        child: _buildTextField(Icons.person, 'Apellidos',
                            TextInputType.name, _lastNameController)),
                  ],
                ),
                const SizedBox(height: 25),
                _buildTextField(Icons.email, 'Correo',
                    TextInputType.emailAddress, _emailController),
                const SizedBox(height: 25),
                _buildTextField(
                    Icons.lock,
                    'Contraseña',
                    isPassword: true,
                    TextInputType.visiblePassword,
                    _passwordController),
                const SizedBox(height: 25),
                _buildTextField(
                    Icons.lock,
                    'Repite Contraseña',
                    isPassword: true,
                    TextInputType.visiblePassword,
                    _repeatPasswordController),
                const SizedBox(height: 25),
                _buildTextField(Icons.account_tree_sharp, 'AnyDesk',
                    TextInputType.number, _anyDeskController),
                const SizedBox(height: 40),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 80),
                  ),
                  onPressed: () {
                    _usuario.nombre = _nameController.text;
                    _usuario.ap_Paterno =
                        _lastNameController.text.split(" ")[0];
                    try {
                      _usuario.ap_Materno =
                          _lastNameController.text.split(" ")[1];
                    } catch (_) {
                      _usuario.ap_Materno = "";
                    }
                    _usuario.email = _emailController.text;
                    _usuario.password = _passwordController.text;
                    _usuario.anyDesk = _anyDeskController.text;
                    if (_usuario.nombre!.isEmpty ||
                        _usuario.ap_Paterno!.isEmpty ||
                        _usuario.email!.isEmpty ||
                        _usuario.password!.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Por favor complete todos los campos"),
                          backgroundColor: Colors.black,
                        ),
                      );
                      return;
                    }
                    if (_usuario.password != _repeatPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Las contraseñas no coinciden"),
                          backgroundColor: Colors.black,
                        ),
                      );
                      return;
                    }

                    context
                        .read<RegistroBloc>()
                        .add(RegistroWhithCredentials(_usuario));
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText,
      TextInputType inputType, TextEditingController controller,
      {bool isPassword = false}) {
    return TextFormField(
      validator: (value) {
        if (controller.text.isEmpty) {
          return 'Por favor ingrese un valor';
        }
        return null;
      },
      controller: controller,
      keyboardType: inputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
