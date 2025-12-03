import 'package:api_cep/cubit/cep_cubit.dart';
import 'package:flutter/material.dart';
import 'package:api_cep/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CepCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Consulta CEP',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        routerDelegate: routes.routerDelegate,
        routeInformationProvider: routes.routeInformationProvider,
        routeInformationParser: routes.routeInformationParser,
      ),
    );
  }
}
