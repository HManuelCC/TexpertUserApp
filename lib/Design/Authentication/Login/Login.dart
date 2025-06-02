import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supportapp/Bloc/LoginBloc/LoginBloc.dart';
import 'package:supportapp/Bloc/LoginBloc/LoginEvent.dart';
import 'package:supportapp/Bloc/LoginBloc/LoginState.dart';
import 'package:supportapp/Design/Inicio/Inicio.dart';
import 'package:supportapp/Design/Loading/Cargando.dart';
import 'package:supportapp/Design/Authentication/Registro/Registro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _usernmae = "";
  String _password = "";

  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          print("Failature");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.black,
            ),
          );
        }
        if (state is LoginSuccess) {
          try {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text("Bienvenido '${state.user!.nombre!.split(" ")[0]}'"),
                backgroundColor: Colors.black,
              ),
            );
          } catch (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Bienvenido '${state.user!.nombre}'"),
                backgroundColor: Colors.black,
              ),
            );
          }
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        if (state is LoginSuccess) {
          return Inicio(
            usuario: state.user!,
          );
        }
        if (state is LoginLoading) {
          return Cargando();
        }
        return _loginDesign(context);
      }),
    );
  }

  Widget _loginDesign(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SupportApp',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade900, Colors.blue.shade200],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/logo_support_app.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.black, width: 3),
                        color: Colors.black12),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      _isPasswordVisible = false;
                    });
                    _usernmae = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail, color: Colors.white),
                    hintText: "Correo",
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _isPasswordVisible = false;
                    });
                    _password = value;
                  },
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () => {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          })
                        },
                        child: Icon(
                          !_isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.blue.shade100,
                        ),
                      ),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    hintText: "Contraseña",
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CreateAccountScreen()));
                          },
                          child: const Text(
                            "No tienes una cuanta? Registrate",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextButton(
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
                      context
                          .read<LoginBloc>()
                          .add(LoginWhithCredentials(_usernmae, _password));
                    },
                    child: const Text(
                      'Aceptar',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
