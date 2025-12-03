import 'package:api_cep/cubit/cep_cubit.dart';
import 'package:api_cep/cubit/cep_state.dart';
import 'package:api_cep/pages/mostrar_cep/controller/demonstrativo_cep_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemonstrativoCep extends StatefulWidget {
  const DemonstrativoCep({super.key});

  @override
  State<DemonstrativoCep> createState() => _DemonstrativoCepState();
}

class _DemonstrativoCepState extends State<DemonstrativoCep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CepCubit, CepState>(
              builder: (context, state) {
                if (state is LoadingCepState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ErrorCepState) {
                  return TextError().textError();
                } else if (state is SuccessCepState) {
                  final cepData = state.cepModel;

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 300,
                      width: 400,
                      child: Card(
                        color: Colors.white,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    'CEP:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Rua:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Bairro:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Cidade:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Estado:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(cepData.cep),
                                  Text(cepData.logradouro),
                                  Text(cepData.bairro),
                                  Text(cepData.localidade),
                                  Text(cepData.uf),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Nova consulta',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
