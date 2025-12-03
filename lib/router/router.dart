import 'package:api_cep/pages/pequisa_cep/pesquisa_cep_page.dart';
import 'package:api_cep/pages/mostrar_cep/demonstrativo_cep.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  //initialLocation: '/endereco',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const PesquisaCepPage()),
    GoRoute(
      path: '/endereco',
      builder: (context, state) => const DemonstrativoCep(),
    ),
  ],
);
