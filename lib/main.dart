import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supportapp/Bloc/AuthenticationBloc/AuthenticationBloc.dart';
import 'package:supportapp/Bloc/LoginBloc/LoginBloc.dart';
import 'package:supportapp/Bloc/RegistroBloc/RegistroBloc.dart';
import 'package:supportapp/Design/Authentication/Login/Login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Bloquea solo en modo vertical
  ]).then((_) {
    runApp(MultiBlocProvider(providers: [
      BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(),
      ),
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
      ),
      BlocProvider<RegistroBloc>(
        create: (context) => RegistroBloc(),
      ),
    ], child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*routes: {
        '/login': (context) => Login(),
        '/register': (context) => CreateAccountScreen(),
        '/home': (context) => Inicio(),
      },*/
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: const InitComponent(),
    );
  }
}

class InitComponent extends StatelessWidget {
  const InitComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Login();
  }

  Widget RegisterAuth(BuildContext context) {
    return Login();
  }
}
